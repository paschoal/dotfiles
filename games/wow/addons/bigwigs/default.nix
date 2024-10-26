{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "v366.1";
    name = "bigwigs";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "2382";
      file = "5820495";
      hash = "sha256-yy1RLWUk5GwSwGQEvP3iBbnV1U+vCgTJ2AjCif5m2h8=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv BigWigs $out/
      mv BigWigs_Core $out/
      mv BigWigs_Options $out/
      mv BigWigs_Plugins $out/
    '';
  };
in {
  home.file.wowaddons-bigwigs = {
    source = "${addon}/BigWigs";
    target = "games/addons/BigWigs";
  };

  home.file.wowaddons-bigwigs-core = {
    source = "${addon}/BigWigs_Core";
    target = "games/addons/BigWigs_Core";
  };

  home.file.wowaddons-bigwigs-options = {
    source = "${addon}/BigWigs_Options";
    target = "games/addons/BigWigs_Options";
  };

  home.file.wowaddons-bigwigs-plugins = {
    source = "${addon}/BigWigs_Plugins";
    target = "games/addons/BigWigs_Plugins";
  };
}
