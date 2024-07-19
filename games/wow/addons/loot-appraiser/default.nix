{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-loot-appraiser";

    version = "v2.2.4";
    project = "88497";
    file = "5330598";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-ZBtHS90NqEyLFLIa3uD6AaH7w4YD9xtd+Bd/hN509P0=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv LootAppraiser $out/
    '';
  };
in {

  home.file.wowaddons-loot-appraiser = {
    source = "${addon}/LootAppraiser";
    target = "games/addons/LootAppraiser";
  };
}
