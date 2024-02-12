{ config, pkgs, ... }:

{
  home.pointerCursor =
    let
      getFrom = url: hash: name: {
        name = name;
        size = 64;
        package =
          pkgs.runCommand "moveUp" {} ''
            mkdir -p $out/share/icons
            ln -s ${
              pkgs.fetchzip {
                url = url;
                hash = hash;
              }
            } $out/share/icons/${name}
          '';
      };
    in
      getFrom
      "https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-BigSur.tar.gz"
      "sha256-VZWFf1AHum2xDJPMZrBmcyVrrmYGKwCdXOPATw7myOA="
      "macOS-BigSur";
}
