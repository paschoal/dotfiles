{
  lib,
  pkgs,
  nixpkgs,
  environment,
  config,
  options,
  specialArgs,
  modulesPath,
  ...
}:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam-unwrapped"
    "steam"
    "steam-original"
    "steam-run"
  ];

  environment.systemPackages = with pkgs; [
    protonup
    wineWowPackages.staging
    winetricks
    bottles
    mangohud
  ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode = {
      enable = true;
      enableRenice = true;
    };
  };

  users.users.paschoal = {
    extraGroups = ["gamemode"];
  };

  hardware.steam-hardware.enable = true;
}
