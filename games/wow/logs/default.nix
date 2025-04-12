{
  config,
  pkgs,
  lib,
  specialArgs,
  modulesPath,
  options,
}:

{
  home.packages = [
    (
      pkgs.appimageTools.wrapType2 rec {
        pname = "warcraft-logs";
        version = "v8.16.25";
        src = pkgs.fetchurl {
          url = "https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/${version}/warcraftlogs-${version}.AppImage";
          hash = "sha256-/HHxJgdL5Opwa2ZPZxl7DmVXWbuPzqrvYINapKMKmaI=";
        };
      }
    )
  ];
}
