{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-blizzmove";

    version = "3.5.38";
    project = "17809";
    file = "5662059";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-pJZAO/r9ojaqQoHaXKTj6WB8W80GvAAzH2TYfDRXxFg=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv BlizzMove $out/
    '';
  };
  in {
    home.file.wowaddons-blizzmove = {
      source = "${addon}/BlizzMove";
      target = "games/addons/BlizzMove";
    };
  }
