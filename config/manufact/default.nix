{ config, pkgs, ... }:

let stable-pkgs = import <nixos-stable> { };
in {
  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

  home.packages = [
    stable-pkgs.freecad
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
