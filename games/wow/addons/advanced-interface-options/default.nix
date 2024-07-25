{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-advanced-interface-options";

    version = "1.9.0-3";
    project = "99982";
    file = "5418533";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-fZvktTCNKSybmA18xTB+BKDiDBhUn+h2z/SEB2s8S+Q=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv AdvancedInterfaceOptions $out/
    '';
  };
in {
  home.file.wowaddons-advanced-interface-options = {
    source = "${addon}/AdvancedInterfaceOptions";
    target = "games/addons/AdvancedInterfaceOptions";
  };
}
