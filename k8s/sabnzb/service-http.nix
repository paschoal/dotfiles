{
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    name = "sabnzb-http";
    labels.app = "sabnzb";
  };
  spec = {
    selector.app = "sabnzb";
    ports = [
      {
        name = "sabnzb-http";
        targetPort = "sabnzb-http";
        protocol = "TCP";
        port = 80;
      }
    ];
  };
}
