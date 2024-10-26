{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "1.2.17";
    name = "no-auto-close";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "689952";
      file = "5776528";
      hash = "sha256-c65i8lMfxTdYBMGI5zjsFyXMBT4xK9B7JPTHhcs5MCk=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv NoAutoClose $out/
    '';
  };
in {
  home.file.wowaddons-no-auto-close = {
    source = "${addon}/NoAutoClose";
    target = "games/addons/NoAutoClose";
  };
}
