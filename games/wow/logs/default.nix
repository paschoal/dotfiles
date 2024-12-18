{ config, pkgs, lib, ... }:

{
  home.packages = [
    (
      pkgs.appimageTools.wrapType2 rec {
        pname = "warcraft-logs";
        version = "v8.14.35";
        src = pkgs.fetchurl {
          url = "https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/${version}/warcraftlogs-${version}.AppImage";
          hash = "sha256-K2fGY6yupY9sJXpougWCFQDtDx1KFV7Vhborc1PpwgA=";
        };
      }
    )
  ];
}
