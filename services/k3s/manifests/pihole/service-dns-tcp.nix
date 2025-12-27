{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "pihole-dns-tcp";
    labels.app = "pihole";
    annotations."metallb.io/allow-shared-ip" = "2.9";
    annotations."metallb.io/loadBalancerIPs" = "192.168.2.9";
  };
  spec = {
    selector.app = "pihole";
    ports = [
      {
        name = "pihole-dns";
        targetPort = "pihole-dns";
        protocol = "TCP";
        port = 53;
      }
    ];
    type = "LoadBalancer";
    externalTrafficPolicy = "Local";
  };
}
