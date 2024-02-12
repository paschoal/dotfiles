{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";

  imports = [
    ./wofi
    ./nvim
    ./eww
    ./cursor
    ./kitty
    ./hypr
    ./qutebrowser
    ./liquidprompt
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
  ];

  home.packages = [
    pkgs.monoid
    pkgs.bat
    pkgs.stow
    pkgs.pass
    pkgs.zsh-completions
    pkgs.wineWowPackages.staging
    pkgs.discord
  ];

  home.stateVersion = "23.11";
  home.enableNixpkgsReleaseCheck = false;

  programs = {
    home-manager = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "Matheus Paschoal";
      userEmail = "paschoal@gmail.com";
    };
  };
}
