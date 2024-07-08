{ config, pkgs, callPackage, ... }:

{
  environment.pathsToLink = ["/libexec"];

  services.displayManager = {
    defaultSession = "none+i3";
  };

  services.xserver = {
    enable = true;

    excludePackages = with pkgs; [
      xterm
    ];

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
    };

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
  };
}
