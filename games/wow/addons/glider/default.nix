{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "0.2.17";
    name = "glider";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "905924";
      file = "5655467";
      hash = "sha256-OYALVnlUl9rAz25b/FsrikAT0f6OMnu9bMGlW6OIGAM=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv Glider $out/
    '';
  };
in {
  home.file.wowaddons-glider = {
    source = "${addon}/Glider";
    target = "games/addons/Glider";
  };
}
