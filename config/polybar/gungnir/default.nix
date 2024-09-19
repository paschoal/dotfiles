{ config, lib, pkgs, ... }:

{
  config = {
    xdg.configFile = {
      polybar = {
        source = ./config;
        recursive = true;
      };
    };

    nixpkgs.config = {
      packageOverrides = pkgs: rec {
        polybar = pkgs.polybar.override {
          i3Support = true;
        };
      };
    };

    home.packages = with pkgs; [
      polybar
    ];

    home.file = {
      "polybar-launcher" = {
        target = "${config.home.homeDirectory}/bin/polybar-launcher";
        enable = true;
        source = let
          script = pkgs.writeShellScriptBin "launcher" ''
            ps aux \
              | grep polybar \
              | grep -v grep \
              | awk '{print $2}' \
              | sed -n 's/^[^ ]*[ ]*\([^ ]*\).*/\1/p' \
              | while read pid; do
                  kill "$pid"
                done
            ${pkgs.polybar}/bin/polybar default &
          '';
          in "${script}/bin/launcher";
      };
    };
  };
}
