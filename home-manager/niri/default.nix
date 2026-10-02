{ config, lib, ... }:

{
  options = {
    niri-config = {
      video = {
        resolution = lib.mkOption {
          default = "1920x1080@60";
          type = lib.types.str;
        };

        display = lib.mkOption {
          default = "eDP-1";
          type = lib.types.str;
        };
      };

      screenshot = {
        path = lib.mkOption {
          default = "~/screenshots/%Y%m%d%H%M%S.png";
          type = lib.types.str;
        };
      };
    };
  };
  config.xdg.configFile = {
    "niri/config.kdl" = {
      enable = true;
      text = ''
        spawn-sh-at-startup "QSG_RHI_BACKEND=vulkan quickshell --config main"

        output "${config.niri-config.video.display}" {
          mode "${config.niri-config.video.resolution}"
        }

        input {
          mod-key "Alt"

          mouse {
            accel-speed 0
          }
        }

        layout {
          gaps 0

          focus-ring {
            off
          }

          border {
            off
          }
        }

        window-rule {
          match is-active=false
          opacity 0.8
        }

        window-rule {
          match is-floating=true
          match app-id="steam_app_default"
          default-floating-position x=10 y=10 relative-to="top-left"
        }

        prefer-no-csd

        screenshot-path "${config.niri-config.screenshot.path}"

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

          Mod+Control+h { focus-monitor-left; }
          Mod+Control+l { focus-monitor-right; }

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

          XF86AudioMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
          XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-"; }
          XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+"; }
          XF86AudioMicMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
          XF86MonBrightnessDown { spawn "brightnessctl" "set" "10%-"; }
          XF86MonBrightnessUp { spawn "brightnessctl" "set" "10%+"; }
          // XF86Display {}
          // XF86WLAN {}
        }
      '';
    };
  };
}
