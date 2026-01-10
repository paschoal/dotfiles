{ config, lib, ... }:
{
  xdg.configFile = lib.mkIf config.eww.modules.volume {
    "eww/volume.scss".text = ''
        .volume {
          margin-left: $between;
          padding: $horizontal-padding;
          border-radius: $radius;
          background: $background;
          color: $foreground;
        }
    '';

    "eww/volume.yuck".text = ''
      (defpoll volper :interval "1s" :initial 5 `wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}'`)
      (defwidget volume[]
        (eventbox
          :onscroll `echo {} | sed -e 's/up/+/g' -e 's/down/-/g' | xargs -I% wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01%`
          (box
           :class 'volume'
            (label :class 'icon' :text '')
            (circular-progress
              :start-at 0
              :thickness 4
              :value {volper * 100}
            )
          )
        )
      )
    '';
  };
}
