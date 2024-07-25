{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-littlewigs";

    version = "v11.0.0";
    project = "4383";
    file = "5557646";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-cfRAtJoxaL5LVJjaH07iJLpyo0av7hlPRzehWEHKFEE=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv LittleWigs $out/
    '';
  };
  in {
    home.file.wowaddons-littlewigs = {
      source = "${addon}/LittleWigs";
      target = "games/addons/LittleWigs";
    };
  }
