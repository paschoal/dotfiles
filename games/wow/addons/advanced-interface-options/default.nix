{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-advanced-interface-options";
    version = "";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/99982/files/5041155/download";
      hash = "sha256-l0QRnTUI9Q4wKWPt8sWsIG4mixCAAMnQCeJocrslJYQ=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv AdvancedInterfaceOptions $out/
    '';
  };
in {
  home.file.wowaddons-advanced-interface-options = {
    source = "${addon}/AdvancedInterfaceOptions";
    target = "games/addons/AdvancedInterfaceOptions";
  };
}
