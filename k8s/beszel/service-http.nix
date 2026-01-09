{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "beszel-http";
    labels.app = "beszel";
  };
  spec = {
    selector.app = "beszel";
    ports = [
      {
        name = "beszel-http";
        targetPort = "beszel-http";
        protocol = "TCP";
        port = 80;
      }
    ];
    type = "ClusterIP";
  };
}
