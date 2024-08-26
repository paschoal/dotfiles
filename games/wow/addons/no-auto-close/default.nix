{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-no-auto-close";

    version = "1.2.11";
    project = "689952";
    file = "5531647";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-LxLBinORKgM1cPiQLUtI7n47IhgGmIWcEAkJnlAcJak=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv NoAutoClose $out/
    '';
  };
  in {
    home.file.wowaddons-no-auto-close = {
      source = "${addon}/NoAutoClose";
      target = "games/addons/NoAutoClose";
    };
  }
