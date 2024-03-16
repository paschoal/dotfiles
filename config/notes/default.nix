{ config, pkgs, lib, ... }:

{
  imports = [
    ./plugins/obsidian-nvim
  ];

  home.packages = with pkgs; [
    obsidian
  ];
}
