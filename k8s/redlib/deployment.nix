{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata.name = "redlib";
  metadata.labels.app = "redlib";
  spec = {
    replicas = 1;
    selector.matchLabels.app = "redlib";
    template = {
      metadata.labels.app = "redlib";
      spec = {
        containers = [
          {
            name = "redlib";
            image = "quay.io/redlib/redlib:latest";
            imagePullPolicy = "IfNotPresent";
            ports = [
              { name = "redlib-http"; containerPort = 8080; protocol = "TCP"; }
            ];
          }
        ];
      };
    };
  };
}
