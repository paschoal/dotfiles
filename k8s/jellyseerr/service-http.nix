{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "jellyseerr-http";
    labels.app = "jellyseerr";
  };
  spec = {
    selector.app = "jellyseerr";
    ports = [
      {
        name = "jellyseerr-http";
        targetPort = "jellyseerr-http";
        protocol = "TCP";
        port = 80;
      }
    ];
    type = "ClusterIP";
  };
}
