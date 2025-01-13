{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ xclip ];
  services.picom.enable = true;
  services.displayManager.defaultSession = "none+bspwm";

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;

    windowManager.bspwm = {
      enable = true;
    };

    excludePackages = with pkgs; [ xterm ];
    videoDrivers = [ "amdgpu" ];

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
