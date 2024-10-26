{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "oerred1a";
    name = "opie";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "19406";
      file = "5777633";
      hash = "sha256-otU4kxaCEAnk6kI1/39Msbs1fdKd3ATlqQiU+3XlbSM=";
    };
    nativeBuildInputs = [pkgs.unzip];
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
