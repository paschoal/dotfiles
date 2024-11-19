{ config, pkgs, lib, ... }:

{
  home.packages = [
    (
      pkgs.appimageTools.wrapType2 rec {
        name = "orca-slicer";
        version = "v2.2.0";
        src = pkgs.fetchurl {
          url = "https://github.com/SoftFever/OrcaSlicer/releases/download/${version}/OrcaSlicer_Linux_${version}.AppImage";
          hash = "sha256-3uqA3PXTrrOE0l8ziRAtmQ07gBFB+1Zx3S6JhmOPrZ8=";
        };
        extraPkgs = pkgs: with pkgs; [
          webkitgtk
        ];
      }
    )
  ];
}
