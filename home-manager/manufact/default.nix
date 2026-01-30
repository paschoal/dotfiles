{ pkgs, ... }:

{
  home.packages = with pkgs; [
    freecad
    orca-slicer
  ];
}
