{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      iosevka
      monoid
      noto-fonts
      nerd-fonts.noto
      nerd-fonts.iosevka
      nerd-fonts.monoid
    ];

    enableDefaultFonts = true;
    enableGhostscriptFonts = true;

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Monoid" ];
      };
    };
  };
}
