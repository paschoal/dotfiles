{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "immich-http";
    labels.app = "immich";
  };
  spec = {
    selector.app = "immich";
    ports = [
      {
        name = "immich-http";
        targetPort = "immich-http";
        protocol = "TCP";
        port = 80;
      }
    ];
  };
}
