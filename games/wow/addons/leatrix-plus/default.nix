{ config, pkgs, lib, ... }:

let
  fetchCurseForge = import ../../support/fetchcurseforge { fetchurl = pkgs.fetchurl; };
  addon = pkgs.stdenv.mkDerivation rec {
    version = "11.0.14";
    name = "leatrix-plus";

    src = fetchCurseForge {
      inherit name;
      game = "wow";
      project = "94855";
      file = "5836708";
      hash = "sha256-6bKHmoPLzXjr4Kp2hkVWTJ5aGRRJM980RuwilFcNzXA=";
    };
    nativeBuildInputs = [pkgs.unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out
      mv Leatrix_Plus $out/
    '';
  };
in {
  home.file.wowaddons-leatrix-plus = {
    source = "${addon}/Leatrix_Plus";
    target = "games/addons/Leatrix_Plus";
  };
}
