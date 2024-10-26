{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "3.2.3";
    name = "addon-usage";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "67954";
      file = "5835429";
      hash = "sha256-8AYwHHpPiXopnH7T/JQp6MeiLHYZMhkKDPgUvdDYeOI=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv AddonUsage $out/
    '';
  };
in {
  home.file.wowaddons-addon-usage = {
    source = "${addon}/AddonUsage";
    target = "games/addons/AddonUsage";
  };
}
