{ config, pkgs, ... }:

{
  home.packages = [
  ];

  xdg.configFile = {
    liquidpromptrc = {
      source = ./config/rc;
    };
  };
}
