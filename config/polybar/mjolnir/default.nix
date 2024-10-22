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

      "audio-switch" = {
        target = "${config.home.homeDirectory}/bin/audio-switch";
        enable = true;
        source = let
          script = pkgs.writeShellScriptBin "audio-switch" ''
            #!/bin/sh

            getVolume() {
              volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2 * 100}')
              echo $volume%
            }

            raiseVolume() {
              wpctl set-volume @DEFAULT_SINK@ 5%+
              echo $(getVolume)
            }

            lowerVolume() {
              wpctl set-volume @DEFAULT_SINK@ 5%-
              echo $(getVolume)
            }

            toggleMute() {
              wpctl set-mute @DEFAULT_SINK@ toggle
              echo $(getVolume)
            }

            case $1 in
              "--up")
                raiseVolume
                ;;
              "--down")
                lowerVolume
                ;;
              "--mute")
                toggleMute
                ;;
              *)
                getVolume
            esac
          '';
          in "${script}/bin/audio-switch";
      };
    };
  };
}
