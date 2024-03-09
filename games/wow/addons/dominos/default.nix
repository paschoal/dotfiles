{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-dominos";
    version = "10.2.21";
    src = fetchurl {
      url = "https://cdn.wowinterface.com/downloads/file9085/Dominos-10.2.21.zip?170835612715";
      sha256 = "sha256-Xlhj/bm0j0/JxdkrC1gY2dqClQfmB20eBWgtu17jBIg=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv Dominos $out/
      mv Dominos_Cast $out/
      mv Dominos_Config $out/
      mv Dominos_Progress $out/
      mv Dominos_Roll $out/
      mv Masque_Dominos $out/
    '';
  };
in {
  home.file.wowaddons-dominos = {
    source = "${addon}/Dominos";
    target = "games/addons/Dominos";
  };

  home.file.wowaddons-dominos-cast = {
    source = "${addon}/Dominos_Cast";
    target = "games/addons/Dominos_Cast";
  };

  home.file.wowaddons-dominos-config = {
    source = "${addon}/Dominos_Config";
    target = "games/addons/Dominos_Config";
  };

  home.file.wowaddons-dominos-progress = {
    source = "${addon}/Dominos_Progress";
    target = "games/addons/Dominos_Progress";
  };

  home.file.wowaddons-dominos-roll = {
    source = "${addon}/Dominos_Roll";
    target = "games/addons/Dominos_Roll";
  };

  home.file.wowaddons-dominos-masque = {
    source = "${addon}/Masque_Dominos";
    target = "games/addons/Masque_Dominos";
  };
}
