{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-auctionator";

    version = "v337.5";
    project = "6124";
    file = "5511335";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-vl83RZ4Mk3xtdAVzqtQ1X9OZEn30lLqwyjXg8sHl9dI=";
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
