{ lib, pkgs, nixpkgs, environment, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

  environment.systemPackages = with pkgs; [
    protonup
    wineWowPackages.staging
    winetricks

    (
      lutris.override {
        extraPkgs = pkgs: [
          wineWowPackages.staging
          gamemode
          winetricks
        ];
        extraLibraries = pkgs: [gamemode];
      }
    )
  ];

  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };

  users.users.paschoal = {
    extraGroups = ["gamemode"];
  };
}

