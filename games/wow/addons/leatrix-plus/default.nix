{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-leatrix-plus";

    version = "10.2.40";
    project = "94855";
    file = "5501756";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-JMmtlPTIidXtmy2E4XjYnjTP9e2j5zbqz9ydIRo/Q4w=";
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
