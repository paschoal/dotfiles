{ config, pkgs, lib, ... }:

{
  home.packages = [
    (
      pkgs.appimageTools.wrapType2 rec {
        pname = "orca-slicer";
        version = "v2.3.0";
        src = pkgs.fetchurl {
          url = "https://github.com/SoftFever/OrcaSlicer/releases/download/${version}/OrcaSlicer_Linux_AppImage_${version}.AppImage";
          hash = "sha256-cwediOw28GFdt5GdAKom/jAeNIum4FGGKnz8QEAVDAM=";
        };
        extraPkgs = pkgs: with pkgs; [
          webkitgtk_4_0
        ];
      }
    )
  ];
}
