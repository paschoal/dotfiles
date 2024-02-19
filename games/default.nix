{ lib, pkgs, nixpkgs, environment, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

  environment.systemPackages = with pkgs; [
    wineWowPackages.staging
    lutris
  ];

  programs = {
    steam.enable = true;
  };
}

