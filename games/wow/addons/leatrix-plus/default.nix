{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-leatrix-plus";

    version = "11.0.05";
    project = "94855";
    file = "5649300";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-YFmvl9SkoBYaxrWc1F7/hBqSNyKLNhHxiXQ7FuP7lpg=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out
      mv Leatrix_Plus $out/
    '';
  };
  in {
    home.file.wowaddons-leatrix-plus = {
      source = "${addon}/Leatrix_Plus";
      target = "games/addons/Leatrix_Plus";
    };
  }
