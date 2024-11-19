{ pkgs, ... }:
let
  pyfa = pkgs.python3Packages.buildPythonApplication rec {
    version = "2.61.0";
    pname = "pyfa";
    format = "other";

    src = pkgs.fetchFromGitHub {
      owner = "pyfa-org";
      repo = "Pyfa";
      rev = "v${version}";
      hash = "sha256-VSuRQugUODc+LbhKbzsA09pnqPEIAt0pQS2An/p7r9A=";
    };

    build-system = [ pkgs.python3Packages.setuptools ];
    propagatedBuildInputs = with pkgs.python3Packages; [
      wxpython
      logbook
      matplotlib
      dateutil
      requests
      sqlalchemy_1_4
      cryptography
      markdown2
      beautifulsoup4
      pyaml
      roman
      numpy
      python-jose
      requests-cache
    ];

    buildInputs = with pkgs; [
      python3Packages.pyinstaller
      gsettings-desktop-schemas
      adwaita-icon-theme
    ];

    dontWrapGApps = true;
    nativeBuildInputs = with pkgs; [
      wrapGAppsHook3
      gdk-pixbuf
    ];

    patchPhase = ''
      cat > setup.py <<EOF
        from setuptools import setup
        setup(
          name = "${pname}",
          version = "${version}",
          scripts = ["pyfa.py"],
          packages = setuptools.find_packages(),
        )
      EOF
    '';

    configurePhase = ''
      python db_update.py
    '';

    buildPhase = ''
      ${pkgs.python3Packages.pyinstaller}/bin/pyinstaller \
        --clean \
        --noconfirm \
        pyfa.spec
    '';

    #
    # pyinstaller builds up dist/pyfa/pyfa binary and
    # dist/pyfa/apps directory with libraries and everything else.
    # creating a symbolic link out in $out/bin to $out/share/pyfa to avoid
    # exposing the innards of pyfa to the rest of the env.
    #
    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/share/pixmaps

      cp -r dist/pyfa $out/share/
      cp imgs/gui/pyfa64.png $out/share/pixmaps/pyfa.png
      ln -sf $out/share/pyfa/pyfa $out/bin/pyfa
    '';

    fixupPhase = ''
      runHook preFixup
        wrapProgramShell $out/share/pyfa/pyfa \
          ''${gappsWrapperArgs[@]} \

      runHook postFixup
    '';

    doCheck = false;
  };
in {
  home.packages = [ pyfa ];
}
