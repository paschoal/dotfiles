{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "sonarr-http";
    labels.app = "sonarr";
  };
  spec = {
    selector.app = "sonarr";
    ports = [
      {
        name = "sonarr-http";
        targetPort = "sonarr-http";
        protocol = "TCP";
        port = 80;
      }
    ];
  };
}
