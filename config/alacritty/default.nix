{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      working_directory = "/data/home";
      window.padding = {
        x = 10;
        y = 10;
      };
      window.decorations = "None";
      window.dynamic_title = true;
      font.normal = {
        family = "Iosevka";
        style = "Regular";
      };
      font.size = 13;
      cursor.style = {
        shape = "Block";
        blinking = "On";
      };
      mouse.hide_when_typing = true;

      # dracula theme
      colors.primary = {
        background = "#282a36";
        foreground = "#f8f8f2";
        bright_foreground = "#ffffff";
      };

      colors.cursor = {
        text = "#282a36";
        cursor = "#f8f8f2";
      };

      colors.vi_mode_cursor = {
        text = "CellBackground";
        cursor = "CellForeground";
      };

      colors.selection = {
        text = "CellForeground";
        background = "#44475a";
      };

      colors.normal = {
        black = "#21222c";
        red = "#ff5555";
        green = "#50fa7b";
        yellow = "#f1fa8c";
        blue = "#bd93f9";
        magenta = "#ff79c6";
        cyan = "#8be9fd";
        white = "#f8f8f2";
      };

      colors.bright = {
        black = "#6272a4";
        red = "#ff6e6e";
        green = "#69ff94";
        yellow = "#ffffa5";
        blue = "#d6acff";
        magenta = "#ff92df";
        cyan = "#a4ffff";
        white = "#ffffff";
      };

      colors.search.matches = {
        foreground = "#44475a";
        background = "#50fa7b";
      };

      colors.search.focused_match = {
        foreground = "#44475a";
        background = "#ffb86c";
      };

      colors.footer_bar = {
        background = "#282a36";
        foreground = "#f8f8f2";
      };

      colors.hints.start = {
        foreground = "#282a36";
        background = "#f1fa8c";
      };

      colors.hints.end = {
        foreground = "#f1fa8c";
        background = "#282a36";
      };
    };
  };
}
