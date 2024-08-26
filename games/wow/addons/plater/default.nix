{ config, pkgs, lib, ... }:

{
  home.file.wowaddons-plater = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-plater";

        version = "v585";
        project = "100547";
        file = "5663143";

        src = fetchurl {
          url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
          hash = "sha256-06v5fLFgSmk7ImuVLPP5COLhiuwUvZPwJZTtv4svU/M=";
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
