{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-auctionator";

    version = "10.2.55";
    project = "6124";
    file = "5641402";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-oOSlpFg9bgxxEVLf+ydMuUVlOtFXfwZznQo1Fhz0KIU=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv Auctionator $out/
    '';
  };
  in {
    home.file.wowaddons-auctionator = {
      source = "${addon}/Auctionator";
      target = "games/addons/Auctionator";
    };
  }
