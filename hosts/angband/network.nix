{ ... }:
{
  services.tailscale.enable = true;

  networking = {
    hostName = "angband";
    firewall.enable = true;
    networkmanager.enable = true;
  };
}
