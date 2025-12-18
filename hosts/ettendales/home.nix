{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [
    "/data/home/bin"
  ];

  imports = [
    ../../config/git
    ../../config/zsh
    ../../config/nvim
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  ];

  home.packages = with pkgs; [
    bat
  ];

  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
