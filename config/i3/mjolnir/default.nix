{ config, pkgs, ... }:

{
  xdg.configFile = {
    "i3/config" = {
      text = ''
        set $mod Mod1
        font pango:Iosevka 13

        floating_modifier $mod
        tiling_drag modifier titlebar

        gaps inner 5
        gaps outer 2

        for_window [class="^.*"] border pixel 0
        for_window [class="Steam"] floating enable

        exec_always feh --bg-fill ~/.wallpaper/landscape.jpg
        exec --no-startup-id ${pkgs.ckb-next}/bin/ckb-next --background
        exec --no-startup-id ~/bin/polybar-launcher

        bindsym $mod+Return exec ${pkgs.alacritty}/bin/alacritty
        bindsym $mod+z kill
        bindsym $mod+d exec --no-startup-id ${pkgs.rofi}/bin/rofi -show run

        bindsym XF86AudioRaiseVolume exec --no-startup-id audio-switch --up
        bindsym XF86AudioLowerVolume exec --no-startup-id audio-switch -hdown
        bindsym XF86AudioMute exec --no-startup-id audio-switch --mute

        bindsym $mod+h focus left
        bindsym $mod+j focus up
        bindsym $mod+k focus down
        bindsym $mod+l focus right

        bindsym $mod+Shift+h move left
        bindsym $mod+Shift+j move down
        bindsym $mod+Shift+k move up
        bindsym $mod+Shift+l move right

        bindsym $mod+b split h
        bindsym $mod+n split v

        bindsym $mod+f fullscreen toggle
        bindsym $mod+s layout stacking
        bindsym $mod+w layout tabbed
        bindsym $mod+e layout toggle split

        bindsym $mod+Shift+space floating toggle
        bindsym $mod+space focus mode_toggle
        bindsym $mod+a focus parent

        set $ws1 "1"
        set $ws2 "2"
        set $ws3 "3"
        set $ws4 "4"
        set $ws5 "5"
        set $ws6 "6"
        set $ws7 "7"
        set $ws8 "8"
        set $ws9 "9"
        set $ws10 "10"

        bindsym $mod+1 workspace number $ws1
        bindsym $mod+2 workspace number $ws2
        bindsym $mod+3 workspace number $ws3
        bindsym $mod+4 workspace number $ws4
        bindsym $mod+5 workspace number $ws5
        bindsym $mod+6 workspace number $ws6
        bindsym $mod+7 workspace number $ws7
        bindsym $mod+8 workspace number $ws8
        bindsym $mod+9 workspace number $ws9
        bindsym $mod+0 workspace number $ws10

        bindsym $mod+Shift+1 move container to workspace number $ws1
        bindsym $mod+Shift+2 move container to workspace number $ws2
        bindsym $mod+Shift+3 move container to workspace number $ws3
        bindsym $mod+Shift+4 move container to workspace number $ws4
        bindsym $mod+Shift+5 move container to workspace number $ws5
        bindsym $mod+Shift+6 move container to workspace number $ws6
        bindsym $mod+Shift+7 move container to workspace number $ws7
        bindsym $mod+Shift+8 move container to workspace number $ws8
        bindsym $mod+Shift+9 move container to workspace number $ws9
        bindsym $mod+Shift+0 move container to workspace number $ws10

        bindsym $mod+Shift+c reload
        bindsym $mod+Shift+r restart
        bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

        mode "resize" {
          bindsym h resize shrink width 10 px or 10 ppt
          bindsym j resize grow height 10 px or 10 ppt
          bindsym k resize shrink height 10 px or 10 ppt
          bindsym l resize grow width 10 px or 10 ppt

          bindsym Return mode "default"
          bindsym Escape mode "default"
          bindsym $mod+r mode "default"
        }
        bindsym $mod+r mode "resize"
      '';
    };
  };
}
