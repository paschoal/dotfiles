{ config, pkgs, ... }:

{
  xdg.configFile = {
    "eww/battery.scss".text = ''
      .battery {
        margin-left: $between;
        padding: $horizontal-padding;
        border-radius: $radius;
        background: $background;
        color: $foreground;
      }
    '';

    "eww/battery.yuck".text = ''
      (defpoll power :interval "30s" :initial 5 `cat /sys/class/power_supply/BAT0/capacity`)
      (defwidget battery[]
        (box
          :class 'battery'
          (label :class 'icon' :text '')
          (circular-progress
            :start_at 0
            :thickness 4
            :value {power}
          )
        )
      )
    '';
  };
}
