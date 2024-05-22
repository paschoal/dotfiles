{ lib, pkgs, nixpkgs, environment, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    wineWowPackages.staging
    winetricks
    lutris
    bottles
  ];

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamescope.enable = true;
    gamemode.enable = true;
  };

  users.users.paschoal = {
    extraGroups = ["gamemode"];
  };
}

