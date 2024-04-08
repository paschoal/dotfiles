{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    freecad
    cura
  ];
}
