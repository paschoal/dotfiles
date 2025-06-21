{ lib, config, pkgs, nixpkgs, environment, ... }:
let
  #amdgpu-kernel-module = pkgs.callPackage ./amdgpu-kernel-module.nix {
  #  kernel = config.boot.kernelPackages.kernel;
  #};

in {
  environment.systemPackages = with pkgs; [
    sidequest
    wlx-overlay-s
  ];

  services.wivrn = {
    enable = true;
    openFirewall = true;
    defaultRuntime = true;
    autoStart = true;
    config = {
      enable = true;
      json = {
        scale = 1.0;
        bitrate = 100000000;
        encoders = [
          {
            encoder = "vaapi";
            codec = "h265";
            width = 1.0;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
          }
        ];
      };
    };
  };

  users.users.paschoal.extraGroups = ["plugdev"];
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config": ["/data/home/.local/share/Steam/config"],
      "external_drivers": null,
      "jsonid": "vrpathreg",
      "log": ["/data/home/.local/share/Steam/logs"],
      "runtime": ["${pkgs.opencomposite}/lib/opencomposite"],
      "version": 1
    }
  '';

  #boot.extraModulePackages = [
  #  ( amdgpu-kernel-module.overrideAttrs (_: {
  #    patches = [
  #      (
  #        pkgs.fetchpatch {
  #          name = "cap_sys_nice_begone.patch";
  #          url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
  #          hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
  #        }
  #      )
  #    ];
  #  }))
  #];
}
