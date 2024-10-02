{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-auctionator";

    version = "11.0.12";
    project = "6124";
    file = "5755058";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-Jf8jRcNTcNvf/xM6voFS940B8tSz1P7pATwrJCUIQdU=";
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
