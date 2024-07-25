{ config, pkgs, lib, ... }:

{
  home.file.wowaddons-plater = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-plater";

        version = "v583";
        project = "100547";
        file = "5554145";

        src = fetchurl {
          url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
          hash = "sha256-Ju1MrbY5I7otWtLO/UKLcGfFReUYK2gbALuKqRgk3dY=";
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
