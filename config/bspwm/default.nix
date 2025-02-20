{ config, pkgs, lib, ... }:

{
  options = {
    bspwm-config = {
      steam = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Configure Steam window
        '';
      };

      disable-caps = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Disable caps-lock
        '';
      };

      wallpaper = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Enable wallpaper
        '';
      };

      load-ckb = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Load ckb-next at startup
        '';
      };
    };
  };

  config.xdg.configFile = {
    "bspwm/bspwmrc" = {
      source = let
        base = ''
          bspc monitor -d 1 2 3 4 5
          bspc config border_width        2
          bspc config window_gap          12
          bspc config split_ratio         0.52
          bspc config borderless_monocle  true
        '';

        bits = with lib.lists; [ base ]
          ++ optional config.bspwm-config.steam "bspc rule -a Steam desktop='^5' state=fullscreen follow=on"
          ++ optional config.bspwm-config.disable-caps "${pkgs.xorg.setxkbmap} -option 'caps:none' &"
          ++ optional config.bspwm-config.wallpaper "${pkgs.feh}/bin/feh --bg-fill ~/.wallpaper/landscape.jpg &"
          ++ optional config.bspwm-config.load-ckb "${pkgs.ckb-next}/bin/ckb-next --background &"
        ;

        contnt = lib.strings.concatLines bits;
        script = pkgs.writeShellScriptBin "bspwmrc" contnt;

      in "${script}/bin/bspwmrc";
    };
  };
}

