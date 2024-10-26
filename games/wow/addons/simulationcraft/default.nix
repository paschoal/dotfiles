{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "11.0.2-02";
    name = "simulationcraft";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "82745";
      file = "5681282";
      hash = "sha256-FTxiCQ7x8eaW0Es+H9sF6rb4ANEOgImfb7I4qDAv3wo=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv Simulationcraft $out/
    '';
  };
in {
  home.file.wowaddons-simulationcraft = {
    source = "${addon}/Simulationcraft";
    target = "games/addons/Simulationcraft";
  };
}
