{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-narcissus";

    version = "1.6.5b";
    project = "311718";
    file = "5482704";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-9/staTrwTIntnMFAlAUEWCGQFksJUlcZkzZzpCcIt3k=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv Narcissus $out/
      mv Narcissus_Achievements $out/
      mv Narcissus_BagFilter $out/
      mv Narcissus_Database_NPC $out/
      mv Narcissus_Database_Item $out/
      mv Narcissus_GamePad $out/
      mv Narcissus_Barbershop $out/
    '';
  };
in {

  home.file.wowaddons-narcissus = {
    source = "${addon}/Narcissus";
    target = "games/addons/Narcissus";
  };

  home.file.wowaddons-narcissus-achievements = {
    source = "${addon}/Narcissus_Achievements";
    target = "games/addons/Narcissus_Achievements";
  };

  home.file.wowaddons-narcissus-bag-filter = {
    source = "${addon}/Narcissus_BagFilter";
    target = "games/addons/Narcissus_BagFilter";
  };

  home.file.wowaddons-narcissus-database-npc = {
    source = "${addon}/Narcissus_Database_NPC";
    target = "games/addons/Narcissus_Database_NPC";
  };

  home.file.wowaddons-narcissus-database-item = {
    source = "${addon}/Narcissus_Database_Item";
    target = "games/addons/Narcissus_Database_Item";
  };

  home.file.wowaddons-narcissus-gamepad = {
    source = "${addon}/Narcissus_GamePad";
    target = "games/addons/Narcissus_GamePad";
  };

  home.file.wowaddons-narcissus-barbershop = {
    source = "${addon}/Narcissus_Barbershop";
    target = "games/addons/Narcissus_Barbershop";
  };
}
