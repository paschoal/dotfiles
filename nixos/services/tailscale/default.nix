{ ... }:

{
  services.tailscale = {
    enable = true;
  };

  # networking = {
  #   nftables.enable = true;
  #   firewall = {
  #     enable = true;
  #     trustedInterfaces = [ config.services.tailscale.interfaceName ];
  #     allowedUDPPorts = [ config.services.tailscale.port ];
  #   };
  # };
}
