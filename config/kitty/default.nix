{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.kitty
  ];

  xdg.configFile = {
    kitty = {
      source = ./config;
      recursive = true;
    };
  };
}
