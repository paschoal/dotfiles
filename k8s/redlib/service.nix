{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "redlib-http";
    labels.app = "redlib";
  };
  spec = {
    selector.app = "redlib";
    ports = [
      { name = "redlib-http"; targetPort = "redlib-http"; protocol = "TCP"; port = 80; }
    ];
    type = "ClusterIP";
  };
}
