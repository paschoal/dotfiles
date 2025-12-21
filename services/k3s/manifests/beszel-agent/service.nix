{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "beszel-agent";
    labels.app = "beszel-agent";
  };
  spec = {
    selector.app = "beszel-agent";
    ports = [
      {
        name = "beszel-agent";
        targetPort = "beszel-agent";
        protocol = "TCP";
        port = 45876;
      }
    ];
    type = "LoadBalancer";
    externalTrafficPolicy = "Local";
  };
}
