{ config, pkgs, lib, ... }:

{
  options = {
    xorg-config = {
      amd = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Enable AMD video driver
        '';
      };
    };
  };

  config = {
    environment.systemPackages = with pkgs; [ xclip ];
    services.displayManager.defaultSession = "none+dwm";

    services.xserver = lib.mkMerge [
      {
        enable = true;
        desktopManager.xterm.enable = false;
        windowManager.dwm = {
          enable = true;
          package = with pkgs; dwm.overrideAttrs (
            _: rec {
              patches = [
                ../../config/dwm/patches/1-dwmc.diff
                ../../config/dwm/patches/2-disable-bars.diff
                ../../config/dwm/patches/3-remove-keybinds.diff
              ];

              postInstall = ''
                chmod 0755 $out/bin/dwmc
              '';
            }
          );
        };

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
