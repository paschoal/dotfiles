{ config, pkgs, ... }:

{
  home.packages = [ pkgs.chromium ];
}
