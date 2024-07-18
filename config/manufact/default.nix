{ config, pkgs, ... }:

let
  stable-pkgs = import <nixos-stable> { };
in {
  home.packages = [
    stable-pkgs.freecad
    stable-pkgs.cura
  ];
}
