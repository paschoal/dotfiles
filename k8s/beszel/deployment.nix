{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "beszel";
    labels.app = "beszel";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "beszel";
    strategy.type = "RollingUpdate";
    strategy.rollingUpdate = {
      maxSurge = 1;
      maxUnavailable = 0;
    };
    template = {
      metadata.labels.app = "beszel";
      spec = {
        volumes = [
          { persistentVolumeClaim.claimName = "beszel-volume"; name = "data"; }
        ];
        containers = [
          {
            name = "hub";
            image = "henrygd/beszel";
            imagePullPolicy = "IfNotPresent";
            resources = {
              limits.memory = "512Mi";
              limits.cpu = "0.25";
              requests.memory = "256Mi";
              requests.cpu = "0.25";
            };
            envFrom = [
              { configMapRef.name = "beszel-env"; }
            ];
            ports = [
              { name = "beszel-http"; containerPort = 8090; protocol = "TCP"; }
            ];
            volumeMounts = [
              { mountPath = "/beszel_data"; name = "data"; }
            ];
          }
        ];
      };
    };
  };
}
