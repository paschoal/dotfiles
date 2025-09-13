{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = [ pkgs.docker-compose ];

  users.users.paschoal = {
    extraGroups = [ "docker" ];
  };
}
