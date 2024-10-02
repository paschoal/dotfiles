{ config, pkgs, lib, ... }:

{
  home.file.wowaddons-plater = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-plater";

        version = "v589";
        project = "100547";
        file = "5773796";

        src = fetchurl {
          url = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
          hash = "sha256-XKpRw0jQs0FDxoXVwnIWrp5O3umoNnrI1ojgycUpUzw=";
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
