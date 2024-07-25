{ config, pkgs, ... }:

let
  stable-pkgs = import <nixos-stable> { };
in {
  imports = [./orca-slicer];

  home.packages = [
    stable-pkgs.freecad
    stable-pkgs.cura
  ];
}
