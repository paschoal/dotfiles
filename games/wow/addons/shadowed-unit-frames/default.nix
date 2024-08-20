{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-shadowed-unit-frames";

    version = "v4.4.11";
    project = "19268";
    file = "5634380";

    src = fetchurl {
      url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
      hash = "sha256-lPMI84YnyNrr9OBMoaKNKvihgHyJBh0QIH/Iwu+vKDA=";
    };

    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir -p $out
      mv ShadowedUnitFrames $out/
      mv ShadowedUF_Options $out/
    '';
  };
in {
  home.file.wowaddons-shadowed-unit-frames = {
    source = "${addon}/ShadowedUnitFrames";
    target = "games/addons/ShadowedUnitFrames";
  };

  home.file.wowaddons-shadowed-unit-frames-options = {
    source = "${addon}/ShadowedUF_Options";
    target = "games/addons/ShadowedUF_Options";
  };
}
