{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata.name = "valkey";
  spec = {
    replicas = 1;
    selector.matchLabels.app = "valkey";
    template = {
      metadata.labels.app = "valkey";
      spec = {
        containers = [
          {
            name = "valkey";
            image = "valkey/valkey:alpine";
            imagePullPolicy = "IfNotPresent";
            resources = {
              limits.memory = "256Mi";
              limits.cpu = "0.1";
              requests.memory = "64Mi";
              requests.cpu = "0.1";
            };
            ports = [
              { name = "valkey"; containerPort = 6379; protocol = "TCP"; }
            ];
          }
        ];
      };
    };
  };
}
