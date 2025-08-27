{ config, ... }:
{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  users.users.paschoal = {
    extraGroups = [ "docker" ];
  };
}
