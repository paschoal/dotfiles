{ pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";
  home.sessionPath = [
    "/data/home/bin"
  ];

  imports = [
    ../../home-manager/git
    ../../home-manager/zsh
    ../../home-manager/nvim
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
