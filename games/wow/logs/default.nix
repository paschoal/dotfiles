{ config, pkgs, lib, ... }:

{
  home.packages = [
    (
      pkgs.appimageTools.wrapType2 rec {
        pname = "warcraft-logs";
        version = "v8.16.4";
        src = pkgs.fetchurl {
          url = "https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/${version}/warcraftlogs-${version}.AppImage";
          hash = "sha256-XLc70TBJYAkOhREwoz0VVbX8KUsvcIP1RbXMYCkEizE=";
        };
      }
    )
  ];
}
