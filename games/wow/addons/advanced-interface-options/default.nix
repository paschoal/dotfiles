{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-advanced-interface-options";
    version = "1.9.0";
    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/99982/files/5326298/download";
      hash = "sha256-/JqISBfDs6pI5nLDBYX1YPQCiHfDAVb6lS8NM0pykOE=";
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
