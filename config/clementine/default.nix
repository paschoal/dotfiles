{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    clementine
    rockbox-utility
  ];
}
