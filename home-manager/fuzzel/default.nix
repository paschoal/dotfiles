{ ... }:
{
  programs.fuzzel = {
    enable = true;
  };

  xdg.configFile."fuzzel/fuzzel.ini" = {
    text = ''
      font=Iosevka:pixelsize=16:antialias=true:autohint=true;
      prompt="> "
      icons-enabled=yes
      width=120
      terminal=foot -e
      show-actions=yes
      exit-on-keyboard-focus-loss=no

      [dmenu]
      mode=text
      exit-immediately-if-empty=yes

      #
      # dracula theme
      # github.com/dracula/fuzzel.git
      #
      [colors]
      background=282a36dd
      text=f8f8f2ff
      match=8be9fdff
      selection-match=8be9fdff
      selection=44475add
      selection-text=f8f8f2ff
      border=bd93f9ff
    '';
  };
}
