{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-bartender-4";

    version = "4.15.1";
    project = "13501";
    file = "5754478";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-IAvdnNTqA14GEhicy7gzue33KxVGKPo38yS8semmWCc=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv Bartender4 $out/
    '';
  };
  in {
    home.file.wowaddons-bartender-4 = {
      source = "${addon}/Bartender4";
      target = "games/addons/Bartender4";
    };
  }
