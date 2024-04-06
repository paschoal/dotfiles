{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  file = appimageTools.wrapType2 rec {
    name = "wow-logs";
    version = "v8.3.20";
    src = fetchurl {
      url = "https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/${version}/warcraftlogs-${version}.AppImage";
      hash = "sha256-o6gICd1htXzYz6TFY9HmuQRrFdeLZAJKF1ovelFDDo8=";
    };
  };

in {
  config = {
    home.file = {
      "wow-logs" = {
        target = "./bin/wow-logs";
        enable = true;
        source = "${file}/bin/wow-logs";
      };
    };
  };
}
