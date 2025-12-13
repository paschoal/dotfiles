{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "vaultwarden-http";
    labels.app = "vaultwarden";
  };
  spec = {
    selector.app = "vaultwarden";
    ports = [
      {
        name = "vaultwarden-http";
        targetPort = "vw-http";
        protocol = "TCP";
        port = 80;
      }
    ];
    type = "ClusterIP";
  };
}
