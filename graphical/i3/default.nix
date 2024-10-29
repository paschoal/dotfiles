{ config, pkgs, callPackage, ... }:

{
  environment.pathsToLink = ["/libexec"];
  environment.systemPackages = with pkgs; [
    xclip
  ];

  services.displayManager = {
    defaultSession = "none+i3";
  };

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;

    excludePackages = with pkgs; [
      xterm
    ];

    displayManager = {
      lightdm = {
        enable = true;
        extraSeatDefaults = ''
          autologin-quest = false
          autologin-user = paschoal
          autologin-user-timeout = 0
        '';
      };
    };

    videoDrivers = ["amdgpu"];
  };
}
