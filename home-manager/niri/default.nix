{ ... }:

{
  config.xdg.configFile = {
    "niri/config.kdl" = {
      enable = true;
      text = ''
        output "DP-3" {
          mode "2560x1440@150.000"
        }

        input {
          mod-key "Alt"

          mouse {
            accel-speed 0
          }
        }

        layout {
          gaps 16

          focus-ring {
            off
          }

          border {
            off
          }
        }

        screenshot-path "~/screenshots/%Y%m%d%H%M%S.png"

        hotkey-overlay {
          skip-at-startup
        }

        binds {
          Mod+Return { spawn "foot"; }
          Mod+Space { toggle-overview; }
          Mod+d { spawn "fuzzel"; }

          Mod+h { focus-column-left; }
          Mod+j { focus-window-down; }
          Mod+k { focus-window-up; }
          Mod+l { focus-column-right; }

          Mod+Shift+h { move-column-left; }
          Mod+Shift+j { move-window-down; }
          Mod+Shift+k { move-window-up; }
          Mod+Shift+l { move-column-right; }

          Mod+c { center-column; }
          Mod+Shift+c { center-visible-columns; }

          Mod+f { maximize-column; }
          Mod+Shift+f { fullscreen-window; }

          Mod+Minus { set-column-width "-10%"; }
          Mod+Equal { set-column-width "+10%"; }

          Mod+1 { focus-workspace 1; }
          Mod+2 { focus-workspace 2; }
          Mod+3 { focus-workspace 3; }
          Mod+4 { focus-workspace 4; }
          Mod+5 { focus-workspace 5; }
          Mod+Shift+1 { move-column-to-workspace 1; }
          Mod+Shift+2 { move-column-to-workspace 2; }
          Mod+Shift+3 { move-column-to-workspace 3; }
          Mod+Shift+4 { move-column-to-workspace 4; }
          Mod+Shift+5 { move-column-to-workspace 5; }

          Mod+p { screenshot; }
          Mod+Shift+p { screenshot-window; }
          Mod+Ctrl+p { screenshot-screen; }

          Mod+q { close-window; }
          Mod+z { quit; }
        }
      '';
    };
  };
}
