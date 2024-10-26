{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "2.1.2";
    name = "minimalist-chat";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "343965";
      file = "5590929";
      hash = "sha256-1P49kTtNt5VyLitGNJDhrBypRWAg7XD5aBX2V7F4e7k=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv MinimalistChat $out/
    '';
  };
in {
  home.file.wowaddons-minimalist-chat = {
    source = "${addon}/MinimalistChat";
    target = "games/addons/MinimalistChat";
  };
}
