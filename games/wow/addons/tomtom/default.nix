{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-tomtom";
    version = "v3.5.6-release";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/18808/files/5201140/download";
      hash = "sha256-G9ASgoDv9pMZ6Iq1fs5GUte3CK9TCwxd03b44S6NQTY=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv TomTom $out/
    '';
  };
in {
  home.file.wowaddons-tomtom = {
    source = "${addon}/TomTom";
    target = "games/addons/TomTom";
  };
}
