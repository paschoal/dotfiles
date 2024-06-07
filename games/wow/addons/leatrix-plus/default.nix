{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-leatrix-plus";
    version = "10.2.29";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/94855/files/5380879/download";
      sha256 = "sha256-/2TFI5hpL6T7URUtb+MfyrGZsoF8jmawSihxA1qd6YU=";
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
