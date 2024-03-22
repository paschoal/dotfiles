{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-simulationcraft";
    version = "10.2.6-01";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/82745/files/5196310/download";
      hash = "sha256-xXMoEl/QU86Xzl2r6HCVKSSXg/qvqsJ4HV8ff/PWIO0=";
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
