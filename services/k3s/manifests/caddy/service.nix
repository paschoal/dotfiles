{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "caddy-service";
    labels.app = "caddy";
  };
  spec = {
    selector.app = "caddy";
    ports = [
      {
        name = "caddy-http";
        targetPort = "caddy-http";
        protocol = "TCP";
        port = 80;
      }
      {
        name = "caddy-tls";
        targetPort = "caddy-tls";
        protocol = "TCP";
        port = 443;
      }
      {
        name = "caddy-tls-udp";
        targetPort = "caddy-tls-udp";
        protocol = "UDP";
        port = 443;
      }
    ];
    type = "LoadBalancer";
    externalTrafficPolicy = "Local";
  };
}
