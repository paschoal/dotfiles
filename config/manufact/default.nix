{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  file = appimageTools.wrapType2 rec {
    name = "ultimaker-cura";
    version = "5.7.0";
    src = fetchurl {
      url = "https://github.com/Ultimaker/Cura/releases/download/${version}/UltiMaker-Cura-${version}-linux-X64.AppImage";
      hash = "sha256-5PaBhPJKqa8LxEHTRNTLqkcIfC2PkqmTWx9c1+dc7k0=";
    };
  };

in {
  config = {
    home.packages = with pkgs; [
      freecad
    ];

    home.file = {
      "cura" = {
        target = "./bin/cura";
        enable = true;
        source = "${file}/bin/ultimaker-cura";
      };
    };
  };
}
