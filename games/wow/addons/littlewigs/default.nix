{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-littlewigs";
    version = "v10.2.43";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/4383/files/5237114/download";
      hash = "sha256-gOZOYwEAm8wr/C9G8KHeZOeItqsTjb4trCtcsOP4WP0=";
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
