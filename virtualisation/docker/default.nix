{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
  ];

  users.users.paschoal = {
    extraGroups = [ "docker" ];
  };
}
