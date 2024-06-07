{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-tomtom";
    version = "v3.6.2-release";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/18808/files/5325968/download";
      hash = "sha256-+O2K8rxWam0/7/Z1TCrIwpFMRAZO9JW30vvTQ9d97PQ=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv TomTom $out/
    '';
  };
in {
  home.file.wowaddons-tomtom = {
    source = "${addon}/TomTom";
    target = "games/addons/TomTom";
  };
}
