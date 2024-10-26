{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  file = appimageTools.wrapType2 rec {
    name = "wow-logs";
    version = "v8.14.4";
    src = fetchurl {
      url = "https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/${version}/warcraftlogs-${version}.AppImage";
      hash = "sha256-vrzRw3c0IbDCjqo0FmUIBd9v79loJJ6GOYAv6xJQhvs=";
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
