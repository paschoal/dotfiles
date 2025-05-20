{ config, pkgs, lib, ... }:

{
  options = {
    bspwm-config = {
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

      eww = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Launch Eww bar
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
          bspc config pointer_modifier    mod1
          bspc config pointer_action1     move

          bspc rule -a Emulator state=floating
        '';

        bits = with lib.lists; [ base ]
          ++ optional config.bspwm-config.disable-caps "${pkgs.xorg.setxkbmap} -option 'caps:none' &"
          ++ optional config.bspwm-config.wallpaper "${pkgs.feh}/bin/feh --bg-fill ~/.wallpaper/landscape.jpg &"
          ++ optional config.bspwm-config.eww "${pkgs.eww}/bin/eww daemon && ${pkgs.eww}/bin/eww open bar &"
        ;

        contnt = lib.strings.concatLines bits;
        script = pkgs.writeShellScriptBin "bspwmrc" contnt;

      in "${script}/bin/bspwmrc";
    };
  };
}

