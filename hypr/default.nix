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
  };
}
