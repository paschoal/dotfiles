{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "prowlarr-http";
    labels.app = "prowlarr";
  };
  spec = {
    selector.app = "prowlarr";
    ports = [
      {
        name = "prowlarr-http";
        targetPort = "prowlarr-http";
        protocol = "TCP";
        port = 80;
      }
    ];
  };
}
