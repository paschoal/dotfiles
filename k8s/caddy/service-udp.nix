{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "caddy-web-udp";
    labels.app = "caddy";
    annotations."metallb.io/allow-shared-ip" = "2.10";
    annotations."metallb.io/loadBalancerIPs" = "192.168.2.10";
  };
  spec = {
    selector.app = "caddy";
    ports = [
      {
        name = "caddy-tls-udp";
        targetPort = "caddy-tls-udp";
        protocol = "UDP";
        port = 443;
      }
    ];
    type = "LoadBalancer";
  };
}
