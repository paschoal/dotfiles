{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-dialogue-ui";

    version = "0.4.6";
    project = "989270";
    file = "5705362";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-1q/ysDR2CcvDM8dxRJgrUP/so9Qd97JW4xJa8dHkarw=";
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
