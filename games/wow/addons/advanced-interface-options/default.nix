{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-advanced-interface-options";

    version = "2.1.0";
    project = "99982";
    file = "5626351";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-7+reU7+6Iak3BiZVcLEWrXC1Lc57XV5Kc5JQZoGmRPw=";
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
