{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-cell";

    version = "r239";
    project = "409666";
    file = "5656001";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-/VTPWIm42Uepnyt3gSn1e1lBYd6UnanQ35jwKvSAUSI=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv Cell $out/
    '';
  };
in {
  home.file.wowaddons-cell = {
    source = "${addon}/Cell";
    target = "games/addons/Cell";
  };
}
