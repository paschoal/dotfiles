{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
    rofi-pass
  ];

  xdg.configFile = {
    "rofi/config.rasi" = {
      text = ''
        configuration {
          modes: "window,run,drun";
          show-icons: false;
          kb-mode-next: "Alt+Tab";
          kb-mode-previous: "Control+Tab";
        }

        @theme "dracula"
      '';
    };

    "rofi/dracula.rasi" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config/dracula.rasi;
    };

    "rofi-pass/config".text = ''
      BROWSER='xdg-open'
      default_do='typePass'

      clip='primary'
      clip_clear=30
      clipboard_backend=xclip
    '';
  };
}
