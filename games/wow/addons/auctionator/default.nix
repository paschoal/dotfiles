{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-auctionator";

    version = "10.2.55";
    project = "6124";
    file = "5555034";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-jbXP4TAeKWKm+lnBZNXW6UY4NznFUqe3dGP4HkTtic8=";
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
