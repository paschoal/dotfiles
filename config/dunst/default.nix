{ config, pkgs, ... }:
{
  services.dunst.enable = true;
  home.packages = with pkgs; [libnotify];

  xdg.configFile."dunst/dunstrc" = {
    text = ''
      # Display
      monitor = 0

      # Geometry
      with = 300
      height = 300
      origin = bottom-right
      offset = 10x50
      scale = 0
      notification_limit = 0

      # Progress Bar
      progress_bar = true
      progress_bar_height = 10
      progress_bar_frame_width = 1
      progress_bar_min_width = 150
      progress_bar_max_width = 300
      indicate_hidden = yes
      transparency = 0
      separator_height = 1
      padding = 20
      horizontal_padding = 10
      text_icon_padding = 0
      frame_width = 0
      frame_color = "#282A36"
      separator_color = frame
      sort = yes
      idle_threshold = 120

      # Text
      font = Iosevka 14
      line_height = 0
      markup = full
      format = "%s %p\n%b"
      alignment = left
      vertical_alignment = center
      show_age_threshold = 60
      ellipsize = middle
      ignore_newline = no
      stack_duplicates = true
      hide_duplicate_count = false
      show_indicator = yes

      # Icon
      icon_position = left
      min_icon_size = 0
      max_icon_size = 64

      # History
      sticky_history = yes
      history_length = 20

      # Misc/Advanced
      dmenu = ${pkgs.rofi}/rofi -d dmenu
      browser = ${pkgs.xdg-utils}/xdg-open
      always_run_script = true
      title = Dunst
      class = Dunst
      corner_radius = 0
      ignore_dbusclose = false

      [experimental]
        per_monitor_dpi = false

      [urgency_low]
        background = "#282A36"
        foreground = "#6272A4"
        timeout = 10

      [urgency_normal]
        background = "#282A36"
        foreground = "#BD93F9"
        timeout = 10

      [urgency_critical]
        background = "#FF5555"
        foreground = "#F8F8F2"
        frame_color = "#FF5555"
        timeout = 0
    '';
  };
}
