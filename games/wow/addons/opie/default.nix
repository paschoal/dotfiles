{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-opie";
    version = "zeta6";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/19406/files/5385628/download";
      sha256 = "sha256-HUtLTHtH2HwQBWksffynXMtPhUMYgOX/TeOxrvALDWQ=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv OPie/* $out/
    '';
  };
  in {
    home.file.wowaddons-opie = {
    source = addon;
    target = "games/addons/OPie";
  };
}
