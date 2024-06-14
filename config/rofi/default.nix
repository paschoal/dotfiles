{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs.rofi
  ];

  home.file = {
    "dmenu-launcher" = {
      target = "${config.home.homeDirectory}/bin/dmenu-launcher";
      enable = true;
      source = let
        script = pkgs.writeShellScriptBin "launcher" ''
          ${pkgs.rofi}/bin/rofi -show run
        '';
        in "${script}/bin/launcher";
    };
  };

  xdg.configFile = {
    rofi = {
      source = ./config;
      recursive = true;
    };
  };
}
