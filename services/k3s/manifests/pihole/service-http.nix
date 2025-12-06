{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "pihole-http";
    labels.app = "pihole";
  };
  spec = {
    selector.app = "pihole";
    ports = [
      {
        name = "pihole-http";
        targetPort = "pihole-http";
        protocol = "TCP";
        port = 80;
      }
    ];
    type = "ClusterIP";
  };
}
