{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-details";
    version = "20240219.12330.155";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/61284/files/5120901/download";
      hash = "sha256-wRHVsWSI3oFFSTaDKK0wSsgalmujzStr9TPs825wTyg=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv Details $out/
      mv Details_Compare2 $out/
      mv Details_DataStorage $out/
      mv Details_EncounterDetails $out/
      mv Details_RaidCheck $out/
      mv Details_Streamer $out/
      mv Details_TinyThreat $out/
      mv Details_Vanguard $out/
    '';
  };
in {
  home.file.wowaddons-details = {
    source = "${addon}/Details";
    target = "games/addons/Details";
  };

  home.file.wowaddons-details-compare2 = {
    source = "${addon}/Details_Compare2";
    target = "games/addons/Details_Compare2";
  };

  home.file.wowaddons-details-datastorage = {
    source = "${addon}/Details_DataStorage";
    target = "games/addons/Details_DataStorage";
  };

  home.file.wowaddons-details-encounter-details = {
    source = "${addon}/Details_EncounterDetails";
    target = "games/addons/Details_EncounterDetails";
  };

  home.file.wowaddons-details-raid-check = {
    source = "${addon}/Details_RaidCheck";
    target = "games/addons/Details_RaidCheck";
  };

  home.file.wowaddons-details-streamer = {
    source = "${addon}/Details_Streamer";
    target = "games/addons/Details_Streamer";
  };

  home.file.wowaddons-details-tinythreat = {
    source = "${addon}/Details_TinyThreat";
    target = "games/addons/Details_TinyThreat";
  };

  home.file.wowaddons-details-vanguard = {
    source = "${addon}/Details_Vanguard";
    target = "games/addons/Details_Vanguard";
  };
}
