{ ... }:
{
  services.tailscale.enable = true;

  networking = {
    hostName = "angband";
    firewall = {
      enable = true;
      trustedInterfaces = [ "docker0" ];
      allowedTCPPorts = [
        5432 # postgresql
      ];
      allowedUDPPorts = [
        5432 # postgresql
      ];
    };
    networkmanager.enable = true;
  };
}
