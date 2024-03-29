{ config, pkgs, ... }:

with import <nixpkgs> {};
let
  addon = stdenv.mkDerivation rec {
    name = "wowaddons-suf";
    version = "v4.4.7";
    src = fetchurl {
      url = "https://cdn.wowinterface.com/downloads/file13494/ShadowedUnitFrames-${version}.zip";
      hash = "sha256-6CRyPR8Wj/Eb/n6Cglv39vbRFBmgpxDTYsCJ1/0fN0Q=";
    };
    nativeBuildInputs = [unzip];
    unpackPhase = ''
      unzip $src
    '';
    installPhase = ''
      mkdir $out
      mv ShadowedUnitFrames $out/
      mv ShadowedUF_Options $out/
    '';
  };
in {
  home.file.wowaddons-shadowed-unit-frames = {
    source = "${addon}/ShadowedUnitFrames";
    target = "games/addons/ShadowedUnitFrames";
  };

  home.file.wowaddons-shadowed-uf-options = {
    source = "${addon}/ShadowedUF_Options";
    target = "games/addons/ShadowedUF_Options";
  };
}
