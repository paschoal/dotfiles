{ config, lib, pkgs, ... }:

{
  config = {
    xdg.configFile = {
      polybar = {
        source = ./config;
        recursive = true;
      };
    };

    home.packages = [pkgs.polybar pkgs.killall];
    home.file = {
      "polybar-launcher" = {
        target = "${config.home.homeDirectory}/bin/polybar-launcher";
        enable = true;
        source = let
          script = pkgs.writeShellScriptBin "launcher" ''
            ${pkgs.killall}/bin/killall -q polybar
            while pgrep -x polybar > /dev/null; do sleep 1; done
            ${pkgs.polybar}/bin/polybar default &
          '';
          in "${script}/bin/launcher";
      };
    };
  };
}
