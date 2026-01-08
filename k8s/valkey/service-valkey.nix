{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "valkey";
    labels.app = "valkey";
    annotations."metallb.io/allow-shared-ip" = "2.12";
    annotations."metallb.io/loadBalancerIPs" = "192.168.2.12";
  };
  spec = {
    selector.app = "valkey";
    ports = [
      {
        name = "valkey";
        targetPort = "valkey";
        protocol = "TCP";
        port = 6379;
      }
    ];
    type = "LoadBalancer";
  };
}
