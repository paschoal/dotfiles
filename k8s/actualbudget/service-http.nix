{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "ab-http";
    labels.app = "actualbudget";
  };
  spec = {
    selector.app = "actualbudget";
    ports = [
      { name = "ab-http"; targetPort = "ab-http"; protocol = "TCP"; port = 80; }
    ];
    type = "ClusterIP";
  };
}
