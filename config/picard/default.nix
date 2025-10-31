{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    picard
    rockbox-utility
  ];
}
