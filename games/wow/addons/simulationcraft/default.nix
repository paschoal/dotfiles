{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-simulationcraft";

    project = "82745";
    file = "5632972";
    version = "11.0.2-01";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-Ep0JVNTDEDR03Az3jSKlTQK1cDZnBxNJ0Rbl60QalVo=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv Simulationcraft $out/
    '';
  };

in {
  home.file.wowaddons-simulationcraft = {
    source = "${addon}/Simulationcraft";
    target = "games/addons/Simulationcraft";
  };
}
