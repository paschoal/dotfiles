{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "0.4.7";
    name = "dialogue-ui";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "989270";
      file = "5833163";
      hash = "sha256-fsexUnq6BtFIZ024fvt8AbdNwWsQpsUyVB4Ez5ansZY=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv DialogueUI $out/
    '';
  };
in {
  home.file.wowaddons-dialogue-ui = {
    source = "${addon}/DialogueUI";
    target = "games/addons/DialogueUI";
  };
}
