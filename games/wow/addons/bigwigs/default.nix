{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-bigwigs";

    version = "v341";
    project = "2382";
    file = "5505609";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-SVf/jxPkDFZ8vOvyALMrSp0iMfKQdN2UuaGW29Xv+vU=";
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
