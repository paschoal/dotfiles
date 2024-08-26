{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-dialogue-ui";

    version = "0.4.3";
    project = "989270";
    file = "5659480";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-4Zh4w45L/rxghbeFs6BotD1uU+drbAWqFfBUD2RirMw=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv DialogueUI $out/
    '';
  };
in {
  home.file.wowaddons-dialogue-ui = {
    source = "${addon}/DialogueUI";
    target = "games/addons/DialogueUI";
  };
}
