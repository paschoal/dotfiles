{ config, lib, pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      "alt + d" = "rofi -show run";
      "alt + Tab" = "rofi -show window";
      "alt + Return" = "alacritty";

      "alt + {_,shift +}z" = "bspc node -{c,k}";
      "alt + {_,shift +}{1-9,0}" = "bspc {desktop -f, node -d} '^{1-9,10}'";
      "alt + {_,shift +}{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
      "alt + {w,e,r,t}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
      "alt + b" = "bspc desktop -l next";
    };
  };

  systemd.user.services.sxhkd = {
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
