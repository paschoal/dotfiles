{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.swww
  ];

  xdg.configFile = {
    hypr = {
      source = ./config;
      recursive = true;
    };
  };
}
