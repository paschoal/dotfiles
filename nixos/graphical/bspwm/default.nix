{ config, pkgs, lib, ... }:

{
  options = {
    xorg-config = {
      amd = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Specify AMD video driver
        '';
      };
    };
  };

  config = {
    environment.systemPackages = with pkgs; [ xclip ];
    services.displayManager.defaultSession = "none+bspwm";

    services.xserver = lib.mkMerge [
      {
        enable = true;
        desktopManager.xterm.enable = false;
        windowManager.bspwm.enable = true;

        excludePackages = with pkgs; [ xterm ];

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
      }

      (
        lib.mkIf config.xorg-config.amd {
          videoDrivers = [ "amdgpu" ];
        }
      )
    ];
  };
}
