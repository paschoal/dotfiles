{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  file = appimageTools.wrapType2 rec {
    name = "orca-slicer";
    version = "v2.1.1";
    src = fetchurl {
      url = "https://github.com/SoftFever/OrcaSlicer/releases/download/${version}/OrcaSlicer_Linux_${version}.AppImage";
      hash = "sha256-kvM1rBGEJhjRqQt3a8+I0o4ahB1Uc9qB+4PzhYoNQdM=";
    };
    extraPkgs = pkgs: with pkgs; [
      webkitgtk
    ];
  };
in {
  home.file = {
    "orca-slicer" = {
      target = "./bin/orca-slicer";
      enable = true;
      source = "${file}/bin/orca-slicer";
    };
  };
}
