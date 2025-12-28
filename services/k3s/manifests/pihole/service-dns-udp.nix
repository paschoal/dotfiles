{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "pihole-dns-udp";
    labels.app = "pihole";
    annotations."metallb.io/allow-shared-ip" = "2.9";
    annotations."metallb.io/loadBalancerIPs" = "192.168.2.11";
  };
  spec = {
    selector.app = "pihole";
    ports = [
      {
        name = "pihole-udp";
        targetPort = "pihole-dns-udp";
        protocol = "UDP";
        port = 53;
      }
    ];
    type = "LoadBalancer";
    externalTrafficPolicy = "Local";
  };
}
