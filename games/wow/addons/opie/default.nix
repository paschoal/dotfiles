{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-opie";

    version = "oerred1";
    project = "19406";
    file = "5771730";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-44/yD7F6+eubw2GmnCVGHhCt/jbhiHaVrz4+YpR0+es=";
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
