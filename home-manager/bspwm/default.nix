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

      steam-games-fullscreen = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Setup rule for all steam games to be kept in fullscreen
        '';
      };

      steam-games-library = lib.mkOption {
        default = ~/.steam;
        type = lib.types.path;
        description = ''
          Steam library path
        '';
      };
    };
  };

  config.xdg.configFile = {
    "bspwm/steam" = {
      enable = config.bspwm-config.steam-games-fullscreen;
      text = ''
        #! /usr/bin/env nix-shell
        #! nix-shell -i bash -p bash
        ${lib.strings.toShellVar "library" config.bspwm-config.steam-games-library}
        games=$(ls $library/steam/steamapps/appmanifest_*.acf | sed 's/[^0-9]*//g')
        for game in $games; do
          bspc rule -a steam_app_$game desktop=^5 state=fullscreen
        done
      '';
    };

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
          ++ optional config.bspwm-config.steam-games-fullscreen "sh ./steam &"
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

