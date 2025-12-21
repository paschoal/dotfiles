{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "beszel-deployment";
    labels.app = "beszel";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "beszel";
    strategy.type = "RollingUpdate";
    strategy.rollingUpdate = {
      maxSurge = 1;
      maxUnavailable = 1;
    };
    template = {
      metadata.labels.app = "beszel";
      spec = {
        volumes = [
          { persistentVolumeClaim.claimName = "beszel-data"; name = "data"; }
          { persistentVolumeClaim.claimName = "beszel-socket"; name = "socket"; }
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
              {
                name = "beszel-http";
                containerPort = 8090;
                protocol = "TCP";
              }
            ];
            volumeMounts = [
              { mountPath = "./beszel_data"; name = "data"; }
              { mountPath = "./beszel_socket"; name = "socket"; }
            ];
          }
        ];
      };
    };
  };
}
