{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-better-fishing";

    version = "1.1.28";
    project = "709520";
    file = "5755864";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-kr6gDIgHRSN+MAr/REoGVr3qVhaQbhU9xs/cxAcGZ8s=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      ls -la
      mv BetterFishing $out/
    '';
  };
  in {
    home.file.wowaddons-better-fishing = {
      source = "${addon}/BetterFishing";
      target = "games/addons/BetterFishing";
    };
  }
