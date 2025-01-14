{ config, pkgs, ... }:
{
  environment = {
    pathsToLink = [ "/libexec" ];
    systemPackages = with pkgs; [ xclip ];
  };

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;
    excludePackages = with pkgs; [ xterm ];

    displayManager = {
      lightdm = {
        enable = true;
        extraSeatDefaults = ''
          autologin-guest = false
          autologin-user = paschoal
          autologin-user-timeout = 0
        '';
      };
    };
  };
}
