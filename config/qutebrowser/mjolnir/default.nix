{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.qutebrowser
  ];

  xdg.configFile = {
    qutebrowser = {
      source = ./config;
      recursive = true;
    };
  };
}
