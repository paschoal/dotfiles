{  ... }:
{
  imports = [
    ../modules/bspwm.nix
    ../modules/clock.nix
    ../modules/volume.nix
    ../modules/date.nix
    ../modules/wireplumber.nix
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
      @import './volume.scss';
      @import './date.scss';
      @import './wireplumber.scss';

      .bar {
        padding: 0px;
        font-family: $font;
        font-size: $font-size;
      }
    '';

    "eww/eww.yuck".text = ''
      (defvar eww "eww")
      (include "volume.yuck")
      (include "clock.yuck")
      (include "workspaces.yuck")
      (include "date.yuck")
      (include "wireplumber.yuck")

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
          (wireplumber)
          (volume)
          (date)
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
          :width "2536px"
          :height "30px"
          :anchor "top center"
        )
        (main)
      )
    '';
  };
}
