{ config, pkgs, ... }:

{
  xdg.configFile = {
    "eww/sound.scss".text = ''
        .sound {
          margin-left: $between;
          padding: $horizontal-padding;
          border-radius: $radius;
          background: $background;
          color: $foreground;
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
  };
}
