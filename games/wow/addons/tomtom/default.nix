{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-tomtom";

    project = "18808";
    file = "5492608";
    version = "v3.6.4-release";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-A/cQ2u1kK6VcIUDa8szcq5969FFgUFSlw6rqikPi1+c=";
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
