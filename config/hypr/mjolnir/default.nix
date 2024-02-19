{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.hyprpaper
  ];

  xdg.configFile = {
    hypr = {
      source = ./config;
      recursive = true;
    };

    "hypr/hyprpaper.conf" = {
      text = ''
        preload=$HOME/.wallpaper/ow.landscape.jpg
        preload=$HOME/.wallpaper/ow.portrait.jpg
        wallpaper=DP-3,$HOME/.wallpaper/ow.landscape.jpg
        wallpaper=HDMI-A-1,$HOME/.wallpaper/ow.portrait.jpg
      '';
    };
  };
}
