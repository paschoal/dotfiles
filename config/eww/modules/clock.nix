{ config, pkgs, ... }:
{
  xdg.configFile = {
    "eww/clock.scss".text = ''
      .clock {
        margin-left: $between;
        padding: $horizontal-padding;
        border-radius: $radius;
        background: $background;
        .hour {
          color: $foreground;
          font-weight: bold;
        }
        .minutes {
          color: $foreground;
        }
        .seconds {
          color: $foreground;
          opacity: .5;
        }
      }
    '';

    "eww/clock.yuck".text = ''
      (defpoll time
        :interval "5s"
        :initial `{"hour": "XX", "minutes": "YY", "seconds": "ZZ" }`
        `date +'{"hour":"%H", "minutes":"%M", "seconds": "%S" }'`
      )
      (defwidget clock[]
        (box
          :class 'clock'
          (box :class 'hour' (label :text {time.hour}))
          (box :class 'minutes' (label :text {time.minutes}))
          (box :class 'seconds' (label :text {time.seconds}))
        )
      )
    '';
  };
}
