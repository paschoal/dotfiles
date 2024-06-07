{ config, pkgs, lib, ... }:

{
  home.file.wowaddons-plater = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-plater";
        version = "v580";
        src = fetchurl {
          url = "https://www.curseforge.com/api/v1/mods/100547/files/5374596/download";
          hash = "sha256-fZU+blu9YyeCG+RL3s10nMCc+PdXn0Db/keuco50i+Y=";
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
