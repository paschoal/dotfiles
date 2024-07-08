{ config, pkgs, ... }:

{
  home.packages = with pkgs; [clipmenu];
}
