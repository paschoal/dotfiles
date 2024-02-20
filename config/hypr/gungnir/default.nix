{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.hyprpaper
  ];

  xdg.configFile = {
    "hypr/hyprland.conf" = {
      source = ./config/hyprland.conf;
    };

    "hypr/hyprpaper.conf" = {
      text = ''
        preload=$HOME/.wallpaper/landscape.jpg
      '';
    };
  };
}
