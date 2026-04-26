{ pkgs, ... }:

let
  stable-pkgs = import <nixos-25.11> {};
in {
  home.packages = with pkgs; [
    stable-pkgs.freecad
    orca-slicer
  ];
}
