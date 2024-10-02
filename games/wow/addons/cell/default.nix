{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-cell";

    version = "r240";
    project = "409666";
    file = "5706514";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-TnO5/rKd+QU2dI07QP+jSYD9V2z8wY0A6YgvC4hfYgI=";
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
