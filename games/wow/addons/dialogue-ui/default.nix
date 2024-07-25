{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-dialogue-ui";

    version = "0.3.4";
    project = "989270";
    file = "5557922";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-ScELsy+K06W6xqSI3byCzlSl0CjpRBz6d+Kx6GuEIkE=";
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
