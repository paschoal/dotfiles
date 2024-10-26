{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "3.6.1";
    name = "blizzmove";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "17809";
      file = "5841033";
      hash = "sha256-Sj8P6DfFVTY8Y0F0eVuLEYrjo0M/eu+VjWw2TZVyl30=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv BlizzMove $out/
    '';
  };
in {
  home.file.wowaddons-blizzmove = {
    source = "${addon}/BlizzMove";
    target = "games/addons/BlizzMove";
  };
}
