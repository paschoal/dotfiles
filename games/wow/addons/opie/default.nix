{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-opie";
    version = "zeta5a";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/19406/files/5290324/download";
      sha256 = "sha256-oaO6ksDSErV4z/SrTyiC9JNVL9/hJBoZkGYm+FSlzc0=";
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
