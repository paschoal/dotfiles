{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nicotine-plus
  ];
}
