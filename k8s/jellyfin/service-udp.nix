{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "jellyfin-udp";
    labels.app = "jellyfin";
    annotations."metallb.io/allow-shared-ip" = "2.12";
    annotations."metallb.io/loadBalancerIPs" = "192.168.2.12";
  };
  spec = {
    selector.app = "jellyfin";
    ports = [
      {
        name = "jellyfin-udp";
        targetPort = "jellyfin-udp";
        protocol = "UDP";
        port = 7359;
      }
    ];
    type = "LoadBalancer";
  };
}
