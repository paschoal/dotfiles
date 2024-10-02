{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-blizzmove";

    version = "3.5.42";
    project = "17809";
    file = "5764194";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-JbsqPruWHVQv0kLlDjYNK3tZd3twbrI4winPkIBQqiw=";
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
