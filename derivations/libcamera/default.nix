{
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  gnutls,
  openssl,
  lttng-ust,
  libpisp,
  systemd,
  libyaml,
  python3,
  python3Packages,
  libevent,
}:

let
  version = "0.5.1+rpt20250722";
in stdenv.mkDerivation rec {
    pname = "libcamera";
    inherit version;

    src = fetchFromGitHub {
      owner = "raspberrypi";
      repo = "libcamera";
      tag = "v${version}";
      hash = "sha256-nv098BdGLwrMgHOeOHgAyI9UTq44tPMVXqj1G5COJzE=";
    };

    patches = [
      ./patches/patch-1.patch
      ./patches/patch-2.patch
    ];

    postPatch = ''
      patchShebangs utils/
      patchShebangs src/py/camera
    '';

    strictDeps = true;

    nativeBuildInputs = [
      meson
      ninja
      pkg-config
      gnutls
      openssl
      (
        python3.withPackages (
          ppkgs: [
            ppkgs.pybind11
            ppkgs.jinja2
            ppkgs.pyaml
            ppkgs.ply
          ]
        )
      )
    ];

    buildInputs = [
      lttng-ust
      libpisp
      systemd
      libyaml
      libevent
    ];

    mesonFlags = [
      "-Dv4l2=enabled"
      "-Dtest=false"
      "-Dlc-compliance=disabled"
      "-Dcam=disabled"
      "-Dqcam=disabled"
      "-Ddocumentation=disabled"
      "-Dgstreamer=disabled"
      "-Dpycamera=disabled"
      "-Dpipelines=rpi/vc4,rpi/pisp"
      "-Dipas=rpi/vc4,rpi/pisp"
      "-Dwerror=false"
    ];

    env.NIX_CFLAGS_COMPILE = "-Wno-sign-compare -Wno-stringop-truncation";
}
