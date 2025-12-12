{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "pihole-dns";
    labels.app = "pihole";
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
      {
        name = "pihole-udp";
        targetPort = "pihole-dns-udp";
        protocol = "UDP";
        port = 53;
      }
      {
        name = "pihole-dhcp";
        targetPort = "pihole-dhcp-udp";
        protocol = "UDP";
        port = 67;
      }
    ];
    type = "LoadBalancer";
    externalTrafficPolicy = "Local";
  };
}
