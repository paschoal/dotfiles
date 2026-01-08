{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "bazarr-http";
    labels.app = "bazarr";
  };
  spec = {
    selector.app = "bazarr";
    ports = [
      {
        name = "bazarr-http";
        targetPort = "bazarr-http";
        protocol = "TCP";
        port = 80;
      }
    ];
  };
}
