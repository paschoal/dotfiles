{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "caddy-web-tcp";
    labels.app = "caddy";
    annotations."metallb.io/allow-shared-ip" = "2.10";
    annotations."metallb.io/loadBalancerIPs" = "192.168.2.10";
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
    ];
    type = "LoadBalancer";
  };
}
