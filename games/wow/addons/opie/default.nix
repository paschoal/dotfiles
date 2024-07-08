{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-opie";

    version = "zeta7b";
    project = "19406";
    file = "5483792";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-tUFRsMvTeU9z6TBbWR6YI3DusxVS17d2NSvZVIoj+mw=";
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
