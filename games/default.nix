{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    protonup-ng
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
