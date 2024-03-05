{ config, ... }:

{
  xdg.configFile = {
    "kitty/font.conf" = {
      source = ./config/font.conf;
    };
  };
}
