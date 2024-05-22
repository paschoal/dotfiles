{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-leatrix-plus";
    version = "10.2.28";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/94855/files/5363538/download";
      sha256 = "sha256-pqZsMAU69qmlTEaNAD06eZmJbDRPxoKvgOz3R7y7WCw=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out
      mv Leatrix_Plus $out/
    '';
  };
  in {
    home.file.wowaddons-leatrix-plus = {
      source = "${addon}/Leatrix_Plus";
      target = "games/addons/Leatrix_Plus";
    };
  }
