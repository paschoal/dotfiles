{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      iosevka
      noto-fonts
      nerd-fonts.noto
      nerd-fonts.iosevka
    ];

    enableDefaultPackages = true;
    enableGhostscriptFonts = true;

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Iosevka" ];
      };
    };
  };

  console.font = "${pkgs.kbd}/share/consolefonts/Lat2-Terminus16.psfu.gz";
}
