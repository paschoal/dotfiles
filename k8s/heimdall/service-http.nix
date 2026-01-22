{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "heimdall-http";
    labels.app = "heimdall";
  };
  spec = {
    selector.app = "heimdall";
    ports = [
      {
        name = "heimdall-http";
        targetPort = "heimdall-http";
        protocol = "TCP";
        port = 80;
      }
    ];
    type = "ClusterIP";
  };
}
