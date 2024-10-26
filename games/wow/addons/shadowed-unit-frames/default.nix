{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "v4.4.11";
    name = "shadowed-unit-frames";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "19268";
      file = "5634380";
      hash = "sha256-lPMI84YnyNrr9OBMoaKNKvihgHyJBh0QIH/Iwu+vKDA=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv ShadowedUnitFrames $out/
      mv ShadowedUF_Options $out/
    '';
  };
in {
  home.file.wowaddons-shadowed-unit-frames = {
    source = "${addon}/ShadowedUnitFrames";
    target = "games/addons/ShadowedUnitFrames";
  };

  home.file.wowaddons-shadowed-unit-frames-options = {
    source = "${addon}/ShadowedUF_Options";
    target = "games/addons/ShadowedUF_Options";
  };
}
