{ config, pkgs, lib, ... }:

{
  home.file.wowaddons-plater = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-plater";

        version = "v582";
        project = "100547";
        file = "5468706";

        src = fetchurl {
          url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
          hash = "sha256-eVMbEObt5CA7tiJ+8G/h3PjE1PLQ5xjOEvlQ2g8BP0M=";
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
