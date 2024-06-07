{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-littlewigs";
    version = "v10.2.57";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/4383/files/5379483/download";
      hash = "sha256-UaVztVJMOikKWwukkoZleTcuDbUceePLGd/jsZiBupE=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv LittleWigs $out/
    '';
  };
  in {
    home.file.wowaddons-littlewigs = {
      source = "${addon}/LittleWigs";
      target = "games/addons/LittleWigs";
    };
  }
