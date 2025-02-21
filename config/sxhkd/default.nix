{ config, lib, pkgs, ... }:

{
  options = {
    sxhkd-config = {
      rofi = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Enable rofi keybindings
        '';
      };

      bspwm = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Enable bspwm keybindings
        '';
      };
    };
  };

  config.services.sxhkd = {
    enable = true;
    keybindings = lib.mkMerge [
      {
        "alt + Return" = "alacritty";
      }

      (
        lib.mkIf config.sxhkd-config.rofi {
          "alt + d" = "rofi -show run";
          "alt + s" = "rofi -show drun";
          "alt + f" = "rofi-pass";
          "alt + Tab" = "rofi -show window";
        }
      )

      (
        lib.mkIf config.sxhkd-config.bspwm {
          "alt + {_,shift +}z" = "bspc node -{c,k}";
          "alt + {_,shift +}{1-9,0}" = "bspc {desktop -f, node -d} '^{1-9,10}'";
          "alt + {_,shift +}{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
          "alt + {w,e,r,t}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
          "alt + b" = "bspc desktop -l next";
        }
      )
    ];
  };

  config.systemd.user.services.sxhkd = {
    Unit = {
      Description = "Simple X Hotkey Daemon";
      After = "graphical-session.target";

    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.sxhkd}/bin/sxhkd";
      ExecReload = "kill -SIGUSR1 $MAINPID";
    };
  };
}
