{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.qutebrowser
  ];

  xdg.configFile = {
    "qutebrowser/config.py" = {
      source = ./config/config.py;
    };
  };
}
