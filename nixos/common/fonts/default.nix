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

    enableDefaultPackages = true;
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

  console.font = "Lat2-Terminus16";
}
