{ config, pkgs, ... }:

{
  xdg.configFile = {
    "bspwm/bspwmrc" = {
      source = let
        script = pkgs.writeShellScriptBin "bspwmrc" ''
          bspc monitor -d 1 2 3 4 5
          bspc config border_width        2
          bspc config window_gap          12
          bspc config split_ratio         0.52
          bspc config borderless_monocle  true

          bspc rule -a Steam desktop='^5' state=fullscreen follow=on

          ${pkgs.feh}/bin/feh --bg-fill ~/.wallpaper/landscape.jpg &
          ${pkgs.ckb-next}/bin/ckb-next --background &
        '';
        in "${script}/bin/bspwmrc";
    };
  };
}

