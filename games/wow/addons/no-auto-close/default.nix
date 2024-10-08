{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-no-auto-close";

    version = "1.2.17";
    project = "689952";
    file = "5776528";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-c65i8lMfxTdYBMGI5zjsFyXMBT4xK9B7JPTHhcs5MCk=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv NoAutoClose $out/
    '';
  };
  in {
    home.file.wowaddons-no-auto-close = {
      source = "${addon}/NoAutoClose";
      target = "games/addons/NoAutoClose";
    };
  }
