{ config, pkgs, lib, ... }:

{
  home.file.wowaddons-plater = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-plater";
        version = "v578a";
        src = fetchurl {
          url = "https://www.curseforge.com/api/v1/mods/100547/files/5286133/download";
          hash = "sha256-SyTU8d55XXYLztlX7OZFcatMAhf0HvF8PEHerplw7po=";
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
