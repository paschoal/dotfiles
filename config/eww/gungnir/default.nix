{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.eww
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
