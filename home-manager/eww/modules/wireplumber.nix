{ ... }:
{
  xdg.configFile = {
    "eww/wireplumber.scss".text = ''
      .device {
        margin-left: $between;
        color: $foreground;
        background: $background;
        border-radius: $radius;
        opacity: .5;

        .item { padding: $horizontal-padding };
      }
    '';

    "eww/wp-default.sh" = {
      executable = true;
      text = ''
        #!/run/current-system/sw/bin/sh
        default() {
          wpctl status | awk '/Sinks:/, /Sources:/ { if ($2 == "*") print substr($3, 1, length($3)-1); }'
        }

        wpctl inspect $(default) | awk -F'=' '/node.nick/ { sub(/ /, "", $2); gsub(/"/, "", $2); print $2 }'
      '';
    };

    "eww/wireplumber.yuck".text = ''
      (defpoll dvid :interval "5s" :initial 0 `./wp-default.sh`)
      (defwidget wireplumber[]
        (box
          :class "wireplumber"
          (box
            :space-evenly "false"
            :class "device"
            (label :class "item" :text "󱄠")
            (label :class "item" :text "''${dvid}")
          )
        )
      )
    '';
  };
}
