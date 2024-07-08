{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-littlewigs";

    version = "v10.2.73";
    project = "4383";
    file = "5505614";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-dtCkBpBXjCcot7gzp12Exsj77wUrHX3ECiQYbBjKnC8=";
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
