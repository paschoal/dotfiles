{ pkgs, ... }:

{
  home.packages = with pkgs; [ eww jq ];
  xdg.configFile = {
    "eww/workspaces.scss".text = ''
      .workspaces {
        border-radius: $radius;
        background: $background;
        padding: $horizontal-padding;

        .workspace {
          margin: 0px 2px;
          padding: 0px;
          color: $foreground;
          .empty {
            opacity: .2;
          }
        }
      }
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
      (deflisten spaces :initial `[{"id":1,"active":false,"occupied":false},{"id":1,"active":false,"occupied":false},{"id":1,"active":false,"occupied":false},{"id":1,"active":false,"occupied":false},{"id":1,"active":false,"occupied":false}]` `./workspaces.sh`)
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
  };
}
