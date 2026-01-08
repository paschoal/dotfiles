{ ... }:
{
  xdg.configFile = {
    "eww/wifi.scss".text = ''
      .wifi {
        background: #FF8400;
      }

      .network {
        margin-left: $between;
        color: $foreground;
        background: $background;
        border-radius: $radius;

        .item { padding: $horizontal-padding; }
      }

      .signal {
        margin-left: $between;
        padding: $horizontal-padding;
        color: $foreground;
        opacity: .5;
        border-radius: $radius;
        background: $background;

        .item { padding: $horizontal-padding; }
      }
    '';

    "eww/wifi.yuck".text = ''
      (defpoll sgnl :interval "5s" :initial 0 `iw dev wlp0s20f3 link | awk '/signal/ {print $2}'`)
      (defpoll ntwk :interval "5s" :initial "XXX" `iwgetid -r`)
      (defwidget wifi[]
        (box
          :space-evenly "false"
          (box
            :space-evenly "false"
            :class "network"
            (label :class "item" :text "󰖩")
            (label :class "item" :text {ntwk})
          )
          (box
            :space-evenly "false"
            :class "signal"
            (label :class "item" :text "󱛁")
            (label :class "item" :text "''${sgnl}db")
          )
        )
      )
    '';
  };
}
