{ config, pkgs, lib, ... }:

{
  home.username = "paschoal";
  home.homeDirectory = "/data/home";

  imports = [
    ./zsh
    ./wofi
    ./nvim
    ./eww
    ./cursor
    ./kitty
    ./hypr
    ./qutebrowser
    ./aws-vault
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "awscli2"
  ];

  home.packages = [
    pkgs.monoid
    pkgs.bat
    pkgs.stow
    pkgs.pass
    pkgs.discord
    pkgs.httpie
    pkgs.dbeaver
    pkgs.postgresql
    pkgs.google-cloud-sdk
    pkgs.sops
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

      extraConfig = {
        color = {
          ui = true;
          pager = true;
        };
        rerere = {
          enabled = true;
        };
      };
    };
  };
}
