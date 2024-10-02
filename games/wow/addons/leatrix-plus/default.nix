{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-leatrix-plus";

    version = "11.0.11";
    project = "94855";
    file = "5775793";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-vjh9ShodTaBXOHW6OB7j5wbyzggMsCev5rWPDdXMQ8c=";
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
