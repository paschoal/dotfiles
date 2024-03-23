{ config, pkgs, ... }:

{
  home.file.wowaddons-opie = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-opie";
        version = "zeta4.5b";
        src = fetchzip {
          url = "https://www.townlong-yak.com/addons/gate/93913ce981ba4e02/opie/OPie-${version}.zip";
          sha256 = "sha256-SfYjFTaT/P7uuanfXsU5KH2ihvkjpZrrAjaAsOqbdaE=";
        };
        installPhase = ''
          mv Bundle $out
          mv Libs $out
          mv Meta $out
          mv gfx $out
          mv *.lua $out
          mv *.toc $out
        '';
      }
    );

    target = "games/addons/OPie";
  };
}
