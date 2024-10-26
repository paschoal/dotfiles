{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "v11.0.44";
    name = "littlewigs";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "4383";
      file = "5833879";
      hash = "sha256-/93s0TkK/IVpicD0JObBiTOZf91wf7CywMMwPKwZyfA=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv LittleWigs $out/
    '';
  };
in {
  home.file.wowaddons-littlewigs = {
    source = "${addon}/LittleWigs";
    target = "games/addons/LittleWigs";
  };
}
