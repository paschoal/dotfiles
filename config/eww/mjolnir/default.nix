{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    eww
    jq
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

      .bar {
        padding: 0px;
        font-family: $font;
        font-size: $font-size;
      }

      .center {
        .workspaces {
          border-radius: $radius;
          background: $background;
          padding: 0px 5px;

          .workspace {
            margin: 0px 2px;
            padding: 0px;
            color: $foreground;
            .empty {
              opacity: .2;
            }
          }
        }
      }

      .right {
        .sound {
          padding: 0px 5px;
          border-radius: $radius;
          background: $background;
          color: $foreground;
        }

        .clock {
          margin-left: 5px;
          padding: 0px 5px;
          border-radius: $radius;
          background: $background;
          .hour {
            color: $foreground;
            font-weight: bold;
          }
          .minutes {
            color: $foreground;
          }
        }
      }
    '';

    "eww/sound.yuck".text = ''
      (defpoll volume :interval "5s" :initial 5 `wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}'`)
      (defwidget sound[]
        (eventbox
          :onscroll `echo {} | sed -e 's/up/+/g' -e 's/down/-/g' | xargs -I% wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01%`
          (box
           :class 'sound'
            (label :text '')
            (circular-progress
              :start-at 0
              :thickness 4
              :value {volume * 100}
            )
          )
        )
      )
    '';

    "eww/clock.yuck".text = ''
      (defpoll time
        :interval "5s"
        :initial `{"hour": "XX", "minutes": "YY" }`
        `date +'{"hour":"%H", "minutes":"%M"}'`
      )
      (defwidget clock[]
        (box
          :class 'clock'
          (box :class 'hour' (label :text {time.hour}))
          (box :class 'minutes' (label :text {time.minutes}))
        )
      )
    '';

    "eww/workspaces.sh" = {
      executable = true;
      text = ''
        #!/run/current-system/sw/bin/sh
        ws() {
          bspc wm -d | jq -Mc '
            .primaryMonitorId as $primary |
            .monitors[] |
            select(.id == $primary) |
            .focusedDesktopId as $active |
            .desktops[] |
            {
              id: .id,
              active: (if .id == $active then true else false end),
              occupied: (if .root != null then true else false end)
            }
          ' | jq -sMc
        }

        bspc subscribe desktop | while read -r; do ws; done
      '';
    };

    "eww/workspaces.yuck".text = ''
      (deflisten spaces :initial `[]` `./workspaces.sh`)
      (defwidget workspaces []
        (eventbox
          :onscroll "bspc desktop -f next"
          (box
            :class "workspaces"
            :space-evenly "false"
            :halign "center"
            :orientation "h"
            (for s in spaces
              (box
                :class "workspace"
                (label :visible {s.active} :text "●")
                (label :visible {!s.active && s.occupied} :text "○")
                (label :visible {!s.active && !s.occupied} :class "empty" :text "○")
              )
            )
          )
        )
      )
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
          :width "2536px"
          :height "30px"
          :anchor "top center"
        )
        (main)
      )
    '';
  };
}
