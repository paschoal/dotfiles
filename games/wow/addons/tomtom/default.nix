{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "v4.0.3";
    name = "tomtom";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "18808";
      file = "5655121";
      hash = "sha256-RTLDQ+0CDAOeiZDzyisAAtL3+ho5NwScKnZHHXLrxU0=";
    };
    nativeBuildInputs = [pkgs.unzip];
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
