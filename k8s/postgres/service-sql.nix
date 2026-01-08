{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "sql";
    labels.app = "postgres";
    annotations."metallb.io/allow-shared-ip" = "2.12";
    annotations."metallb.io/loadBalancerIPs" = "192.168.2.12";
  };
  spec = {
    selector.app = "postgres";
    ports = [
      {
        name = "sql";
        targetPort = "sql";
        protocol = "TCP";
        port = 5432;
      }
    ];
    type = "LoadBalancer";
  };
}
