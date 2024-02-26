{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.swww
  ];

  xdg.configFile = {
    "hypr/hyprland.conf" = {
      source = ./config/hyprland.conf;
    };
  };
}
