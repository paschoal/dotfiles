{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "11.0.13";
    name = "auctionator";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "6124";
      file = "5837148";
      hash = "sha256-f61F/ZRShjlzNmqbzeVBza2/GySTuzPjtukZveE9Fz4=";
    };
    nativeBuildInputs = [pkgs.unzip];
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
