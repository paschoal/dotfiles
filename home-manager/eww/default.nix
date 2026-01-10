{ config, lib, pkgs, ... }:
let
  cfg = config.eww;
  mod = lib.types.enum [
    "battery"
    "bspwm"
    "clock"
    "date"
    "volume"
    "wifi"
    "wireplumber"
  ];

in {
  options = {
    eww = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enable eww configuration";
      };
      width = lib.mkOption {
        default = 1900;
        type = lib.types.numbers.positive;
        description = "Width in pixels of the main bar";
      };
      height = lib.mkOption {
        default = 30;
        type = lib.types.numbers.positive;
        description = "Height in pixels of the main bar";
      };
      modules = {
        battery = lib.mkOption { default = false; type = lib.types.bool; };
        bspwm = lib.mkOption { default = false; type = lib.types.bool; };
        clock = lib.mkOption { default = false; type = lib.types.bool; };
        date = lib.mkOption { default = false; type = lib.types.bool; };
        volume = lib.mkOption { default = false; type = lib.types.bool; };
        wifi = lib.mkOption { default = false; type = lib.types.bool; };
        wireplumber = lib.mkOption { default = false; type = lib.types.bool; };
      };
      left = lib.mkOption {
        default = [];
        type = lib.types.listOf mod;
        description = "List of modules to be displayed in left panel";
      };
      center = lib.mkOption {
        default = [];
        type = lib.types.listOf mod;
        description = "List of modules to be displayed in center panel";
      };
      right = lib.mkOption {
        default = [];
        type = lib.types.listOf mod;
        description = "List of modules to be displayed in right panel";
      };
    };
  };

  imports = [
    ./modules/battery.nix
    ./modules/bspwm.nix
    ./modules/clock.nix
    ./modules/date.nix
    ./modules/volume.nix
    ./modules/wifi.nix
    ./modules/wireplumber.nix
  ];

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ eww jq ];

    xdg.configFile = {
      "eww/eww.scss".text = ''
        *{ all: unset; };
        $font: 'Monoisome';
        $font-size: 16px;
        $background: #1A1B2C;
        $foreground: #A9B1D6;
        $radius: 5px;
        $horizontal-padding: 0px 5px;
        $between: 5px;
        .bar {
          padding: 0px;
          font-family: $font;
          font-size: $font-size;
        };
        ${lib.optionalString cfg.modules.battery "@import 'battery.scss'"}
        ${lib.optionalString cfg.modules.bspwm "@import 'bspwm.scss'"}
        ${lib.optionalString cfg.modules.clock "@import 'clock.scss'"}
        ${lib.optionalString cfg.modules.date "@import 'date.scss'"}
        ${lib.optionalString cfg.modules.volume "@import 'volume.scss'"}
        ${lib.optionalString cfg.modules.wifi "@import 'wifi.scss'"}
        ${lib.optionalString cfg.modules.wireplumber "@import 'wireplumber.scss'"}
      '';

      "eww/eww.yuck".text = ''
        (defvar eww "eww")
        ${lib.optionalString cfg.modules.battery "(include 'battery.yuck')"}
        ${lib.optionalString cfg.modules.bspwm "(include 'bspwm.yuck')"}
        ${lib.optionalString cfg.modules.clock "(include 'clock.yuck')"}
        ${lib.optionalString cfg.modules.date "(include 'date.yuck')"}
        ${lib.optionalString cfg.modules.volume "(include 'volume.yuck')"}
        ${lib.optionalString cfg.modules.wifi "(include 'wifi.yuck')"}
        ${lib.optionalString cfg.modules.wireplumber "(include 'wireplumber.yuck')"}

        (defwidget left[]
          (box
            :class "left"
            :space-evenly "false"
            :halign "start"
            ${lib.concatMapStringsSep "\n" (i: "(${i})") cfg.left}
          )
        )

        (defwidget center[]
          (box
            :class "center"
            ${lib.concatMapStringsSep "\n" (i: "(${i})") cfg.center}
          )
        )

        (defwidget right[]
          (box
            :class "right"
            :space-evenly "false"
            :halign "end"
            ${lib.concatMapStringsSep "\n" (i: "(${i})") cfg.right}
          )
        )

        (defwidget main[]
          (box
            :space-evenly "true"
            (left)
            (center)
            (right)
          )
        )

        (defwindow bar
          :class "bar"
          :monitor 0
          :exclusive "true"
          :reserve (struts :distance "${builtins.toString (cfg.height + 5)}px" :size "top")
          :geometry
            (geometry
              :y "10px"
              :width "${builtins.toString cfg.width}px"
              :height "${builtins.toString cfg.height}px"
              :anchor "top center"
            )
          (main)
        )
      '';
    };
  };
}
