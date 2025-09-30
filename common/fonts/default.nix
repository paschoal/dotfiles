{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    iosevka
    monoid
    nerd-fonts.noto
    nerd-fonts.iosevka
    nerd-fonts.monoid
  ];
}
