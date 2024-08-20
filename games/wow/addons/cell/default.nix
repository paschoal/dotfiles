{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-cell";

    version = "r238";
    project = "409666";
    file = "5604056";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-mwPR0vqWKfuu7Zeo3iZA+eMVebgB7w+1B1lvaNw4njM=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv Cell $out/
    '';
  };
in {
  home.file.wowaddons-cell = {
    source = "${addon}/Cell";
    target = "games/addons/Cell";
  };
}
