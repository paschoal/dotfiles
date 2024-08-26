{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-tomtom";

    project = "18808";
    file = "5655121";
    version = "v4.0.3";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-RTLDQ+0CDAOeiZDzyisAAtL3+ho5NwScKnZHHXLrxU0=";
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
