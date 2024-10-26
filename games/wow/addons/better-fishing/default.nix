{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "1.3.1";
    name = "better-fishing";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "709520";
      file = "5844603";
      hash = "sha256-OMcFslXnuBqCCOzVygyK4AhOgIBKb1vB+U3qJa25+FY=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv BetterFishing $out/
    '';
  };
in {
  home.file.wowaddons-better-fishing = {
    source = "${addon}/BetterFishing";
    target = "games/addons/BetterFishing";
  };
}
