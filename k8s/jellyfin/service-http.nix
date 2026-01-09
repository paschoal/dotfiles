{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "jellyfin-http";
    labels.app = "jellyfin";
  };
  spec = {
    selector.app = "jellyfin";
    ports = [
      {
        name = "jellyfin-http";
        targetPort = "jellyfin-http";
        protocol = "TCP";
        port = 80;
      }
    ];
  };
}
