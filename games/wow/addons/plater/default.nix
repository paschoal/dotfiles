{ config, pkgs, lib, ... }:

{
  home.file.wowaddons-plater = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-plater";
        version = "v576a";
        src = fetchurl {
          url = "https://www.curseforge.com/api/v1/mods/100547/files/5120911/download";
          hash = "sha256-/OfgICUDxtgMq2DYH7NlQaIwVABBWgarnTL19zC1AM4=";
        };
        nativeBuildInputs = [unzip];
        unpackPhase = ''
          unzip $src
        '';
        installPhase = ''
          mv Plater/ $out
        '';
      }
    );

    target = "games/addons/Plater";
  };
}
