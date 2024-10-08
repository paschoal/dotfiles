{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-littlewigs";

    version = "v11.0.39";
    project = "4383";
    file = "5775187";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-aAq5g7zhrXwvKsBpuyl1ckaaWW6nNT8ta0h/BgWPxL4=";
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
