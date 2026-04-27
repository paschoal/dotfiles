{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false;
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    protonup-ng
    wine
    winetricks
    mangohud
    lutris
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
