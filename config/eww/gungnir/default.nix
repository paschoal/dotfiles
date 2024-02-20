{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.eww-wayland
    pkgs.jq
    pkgs.socat
  ];

  xdg.configFile = {
    eww = {
      source = ./config;
      recursive = true;
    };
  };
}
