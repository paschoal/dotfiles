{ config, lib, ... }:
{
  xdg.configFile = lib.mkIf config.eww.modules.date {
    "eww/date.scss".text = ''
      .date {
        margin-left: $between;
        padding: $horizontal-padding;
        border-radius: $radius;
        background: $background;
        .weekday {
          color: $foreground;
          font-weight: bold;
        }
        .day {
          color: $foreground;
        }
        .month {
          color: $foreground;
          opacity: .5;
        }
      }
    '';

    "eww/date.yuck".text = ''
      (defpoll date
        :interval "1s"
        :initial `{"month":"XX","day":"YY","weekday":"ZZ"}`
        `date +'{"month":"%b","day":"%d","weekday":"%a"}'`
      )
      (defwidget date[]
        (box
          :class 'date'
          (box :class 'weekday' (label :text {date.weekday}))
          (box :class 'day' (label :text {date.day}))
          (box :class 'month' (label :text {date.month}))
        )
      )
    '';
  };
}
