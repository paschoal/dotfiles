{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "radarr-http";
    labels.app = "radarr";
  };
  spec = {
    selector.app = "radarr";
    ports = [
      {
        name = "radarr-http";
        targetPort = "radarr-http";
        protocol = "TCP";
        port = 80;
      }
    ];
  };
}
