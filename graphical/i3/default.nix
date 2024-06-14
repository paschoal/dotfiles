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

    xrandrHeads = [
      {
        output = "DisplayPort-2";
        primary = true;
        monitorConfig = ''
          Modeline "2560x1440@150" 612.61 2560 2568 2600 2640 1440 1443 1453 1547 +hsync +vsync
          Option "PreferredMode" "2560x1440@150"
        '';
      }
    ];
  };
}
