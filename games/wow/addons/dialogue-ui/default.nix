{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-dialogue-ui";

    version = "0.2.9";
    project = "989270";
    file = "5303932";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-8BQ89vscd4gZTL0A+kpwBjtxGXV3NWm4/zWeJ2+lKqw=";
    };

    nativeBuildInputs = [unzip];
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
