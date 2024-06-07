{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-bigwigs";
    version = "v333";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/2382/files/5395603/download";
      hash = "sha256-T52GuBqaOJNPfD8j8/QFI9BzPoWTHDot7kiGgWnxSfI=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv BigWigs $out/
      mv BigWigs_Core $out/
      mv BigWigs_Options $out/
      mv BigWigs_Plugins $out/
    '';
  };
  in {
    home.file.wowaddons-bigwigs = {
      source = "${addon}/BigWigs";
      target = "games/addons/BigWigs";
    };

    home.file.wowaddons-bigwigs-core = {
      source = "${addon}/BigWigs_Core";
      target = "games/addons/BigWigs_Core";
    };

    home.file.wowaddons-bigwigs-options = {
      source = "${addon}/BigWigs_Options";
      target = "games/addons/BigWigs_Options";
    };

    home.file.wowaddons-bigwigs-plugins = {
      source = "${addon}/BigWigs_Plugins";
      target = "games/addons/BigWigs_Plugins";
    };
  }
