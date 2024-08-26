{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-addon-usage";

    version = "3.2.2";
    project = "67954";
    file = "5626338";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-z2sGY5sGkOzcBbvh3DJk3unNYsl9AlS66sLJm/kKgBw=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv AddonUsage $out/
    '';
  };
  in {
    home.file.wowaddons-addon-usage = {
      source = "${addon}/AddonUsage";
      target = "games/addons/AddonUsage";
    };
  }
