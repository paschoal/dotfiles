{ pkgs, ... }:

let
  stable-pkgs = import <nixos-stable> {};
in {
  home.packages = with pkgs; [
    stable-pkgs.freecad
    orca-slicer
  ];
}
