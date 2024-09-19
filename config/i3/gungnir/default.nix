{ config, pkgs, ... }:

{
  xdg.configFile = {
    i3 = {
      source = ./config;
      recursive = true;
    };
  };
}
