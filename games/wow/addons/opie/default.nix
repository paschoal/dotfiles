{ config, pkgs, ... }:

{
  home.file.wowaddons-opie = {
    source = (
      with import <nixpkgs> {};
      stdenv.mkDerivation rec {
        name = "wowaddons-opie";
        version = "zeta4.5";
        src = fetchzip {
          url = "https://www.townlong-yak.com/addons/gate/d7b52bf73bd91ca2/opie/OPie-${version}.zip";
          hash = "sha256-mLD9Vdvj2veyJtMaow1I7HWaX0tP3l16f6THs56v8tE=";
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
