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
        default = false;
        type = lib.types.bool;
        description = ''
          Enable bspwm keybindings
        '';
      };

      dwm = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Enable dwm keybindings
        '';
      };
    };
  };

  config.services.sxhkd = {
    enable = true;
    keybindings = lib.mkMerge [
      {
        "alt + Return" = "st";
        "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
      }

      (
        lib.mkIf config.sxhkd-config.rofi {
          "alt + {d,s,a}" = "rofi -show {run,drun,window}";
          "alt + f" = "rofi-pass";
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

      (
        lib.mkIf config.sxhkd-config.dwm {
          "alt + {h,l}" = "dwmc setmfact {-,+}0.05";
          "alt + {k,j}" = "dwmc focusstack {-,+}1";
          "alt + z" = "dwmc killclient";
          "alt + {_, shift +}{1-9}" = "dwmc {viewex,tagex} {0-8}";
          "alt + {e,r,t}" = "dwmc setlayoutex {0,1,2}";
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
