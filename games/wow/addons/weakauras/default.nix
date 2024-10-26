{ config, pkgs, lib, ... }:

let
  addon = pkgs.stdenv.mkDerivation rec {
    version = "5.17.3";
    name = "weakauras";

    src = pkgs.fetchurl {
      url = "https://github.com/WeakAuras/WeakAuras2/releases/download/${version}/WeakAuras-${version}.zip";
      hash = "sha256-QLmhz9pmT5DgOboMd3954b6Ykic67Dkqsku0WjB+xWg=";
    };

    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out/
      mv WeakAuras $out/
      mv WeakAurasArchive $out/
      mv WeakAurasModelPaths $out/
      mv WeakAurasOptions $out/
      mv WeakAurasTemplates $out/
    '';
  };
in {
  home.file.wowaddons-weakauras = {
    source = "${addon}/WeakAuras";
    target = "games/addons/WeakAuras";
  };

  home.file.wowaddons-weakauras-archive = {
    source = "${addon}/WeakAurasArchive";
    target = "games/addons/WeakAurasArchive";
  };

  home.file.wowaddons-weakauras-model-paths = {
    source = "${addon}/WeakAurasModelPaths";
    target = "games/addons/WeakAurasModelPaths";
  };

  home.file.wowaddons-weakauras-options = {
    source = "${addon}/WeakAurasOptions";
    target = "games/addons/WeakAurasOptions";
  };

  home.file.wowaddons-weakauras-templates = {
    source = "${addon}/WeakAurasTemplates";
    target = "games/addons/WeakAurasTemplates";
  };
}
