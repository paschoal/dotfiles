{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "ealen-service";
    labels.app = "ealen";
  };
  spec = {
    selector.app = "ealen";
    ports = [
      {
        name = "ealen-http";
        port = 80;
        protocol = "TCP";
        targetPort = "ealen-http";
      }
    ];
    type = "ClusterIP";
  };
}
