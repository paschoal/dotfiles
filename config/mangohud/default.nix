{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs.mangohud
  ];

  xdg.configFile = {
    "MangoHud" = {
      source = ./config;
      recursive = false;
    };
  };
}
