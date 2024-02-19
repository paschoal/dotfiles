{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wofi
  ];

  xdg.configFile = {
    wofi = {
      source = ./config;
      recursive = true;
    };
  };
}
