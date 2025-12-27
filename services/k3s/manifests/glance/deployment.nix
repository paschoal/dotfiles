{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "glance";
    labels = {
      app = "glance";
    };
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "glance";
    strategy.type = "RollingUpdate";
    strategy.rollingUpdate = {
      maxSurge = 1;
      maxUnavailable = 1;
    };
    template = {
      metadata.labels.app = "glance";
      spec = {
        # volumes = [
        #   { name = "glance"; configMap.name = "glance-configmap" };
        #   { name = "home"; configMap.name = "home-configmap" };
        # ];
        containers = [
          {
            name = "glance";
            image = "glanceapp/glance";
            imagePullPolicy = "IfNotPresent";
            resources = {
              limits.memory = "256Mi";
              limits.cpu = "0.5";
              requests.memory = "128Mi";
              requests.cpu = "0.25";
            };
            env = [];
            ports = [
              {
                name = "glance-http";
                containerPort = 8080;
                protocol = "TCP";
              }
            ];
            # volumeMounts = [
            #   { mountPath = "/app/config/glance.yml"; name = "glance"; }
            #   { mountPath = "/app/config/home.yml"; name = "home"; }
            # ];
          }
        ];
      };
    };
  };
}
