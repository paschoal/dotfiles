{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-opie";

    version = "aelling4";
    project = "19406";
    file = "5638807";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-5tBnKsWk1D0is9njSBIbkwyNpXzIbiQi9e8lzjQvF2U=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv OPie/* $out/
    '';
  };
  in {
    home.file.wowaddons-opie = {
    source = addon;
    target = "games/addons/OPie";
  };
}
