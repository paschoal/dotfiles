{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-bartender4";
    version = "4.14.15";
    src = fetchurl {
      url = "https://cdn.wowinterface.com/downloads/file11190/Bartender4-${version}.zip";
      sha256 = "sha256-IAB9SRe0tF3YGuWEErr2Q3qOt+P+edE91o3fKJoJdP0=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv Bartender4 $out/
    '';
  };
in {
  home.file.wowaddons-bartender4 = {
    source = "${addon}/Bartender4";
    target = "games/addons/Bartender4";
  };
}
