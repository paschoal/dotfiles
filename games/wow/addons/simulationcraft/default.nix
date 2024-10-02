{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-simulationcraft";

    project = "82745";
    file = "5681282";
    version = "11.0.2-02";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-FTxiCQ7x8eaW0Es+H9sF6rb4ANEOgImfb7I4qDAv3wo=";
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
