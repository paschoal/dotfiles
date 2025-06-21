{ config, pkgs, ... }:
{
  imports = [
    ../modules/bspwm.nix
    ../modules/clock.nix
    ../modules/sound.nix
  ];

  xdg.configFile = {
    "eww/eww.scss".text = ''
      *{
        all: unset;
      };

      $font: 'Monoisome';
      $font-size: 16px;
      $background: #1A1B2C;
      $foreground: #A9B1D6;
      $radius: 5px;
      $horizontal-padding: 0px 5px;
      $between: 5px;

      @import './workspaces.scss';
      @import './clock.scss';
      @import './sound.scss';

      .bar {
        padding: 0px;
        font-family: $font;
        font-size: $font-size;
      }
    '';

    "eww/eww.yuck".text = ''
      (defvar eww "eww")
      (include "sound.yuck")
      (include "clock.yuck")
      (include "workspaces.yuck")

      (defwidget left[] (box :class "left"))

      (defwidget center[]
        (box
          :class "center"
          (workspaces)
        )
      )

      (defwidget right[]
        (box
          :class "right"
          :space-evenly "false"
          :halign "end"
          (sound)
          (clock)
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
        :reserve (struts :distance "35px" :side "top")
        :geometry (geometry
          :y "10px"
          :width "1900px"
          :height "30px"
          :anchor "top center"
        )
        (main)
      )
    '';
  };
}
