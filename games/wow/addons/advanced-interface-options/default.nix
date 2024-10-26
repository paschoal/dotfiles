{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    name = "advanced-interface-options";
    version = "2.1.0";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "99982";
      file = "5626351";
      hash = "sha256-7+reU7+6Iak3BiZVcLEWrXC1Lc57XV5Kc5JQZoGmRPw=";
    };
    nativeBuildInputs = [pkgs.unzip];
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
