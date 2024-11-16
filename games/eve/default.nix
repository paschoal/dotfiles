{ lib, pkgs, environment, ... }:
let
  package = pkgs.python3Packages.buildPythonApplication rec {
    version = "2.61.0";
    name = "pyfa";
    pyproject = false;

    src = pkgs.fetchFromGitHub {
      owner = "pyfa-org";
      repo = "pyfa";
      rev = "v${version}";
      hash = "sha256-VSuRQugUODc+LbhKbzsA09pnqPEIAt0pQS2An/p7r9A=";
    };

    build-system = [pkgs.python3Packages.setuptools];

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
      wrapGAppsHook
      gdk-pixbuf
    ];

    patchPhase = ''
      cat > setup.py <<EOF
        from setuptools import setup
        setup(
          name = "${name}",
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

    installPhase = ''
      install -dm755 $out/bin
      install -dm755 $out/share/pixmaps

      cp -r dist/pyfa/app $out/bin/app
      cp dist/pyfa/pyfa $out/bin/pyfa

      install -Dm644 imgs/gui/pyfa64.png $out/share/pixmaps/pyfa.png
    '';

    fixupPhase = ''
      runHook preFixup

      wrapProgramShell $out/bin/pyfa \
        ''${gappsWrapperArgs[@]}

      runHook postFixup
    '';

    doCheck = false;
  };
in {
  home.packages = [package];
}
