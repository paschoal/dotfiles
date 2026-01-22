{
  apiVersion = "apps/v1";
  kind = "StatefulSet";
  metadata = {
    name = "actualbudget";
    labels.app = "actualbudget";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "actualbudget";
    template = {
      metadata.labels.app = "actualbudget";
      spec = {
        volumes = [
          { name = "actualbudget-data"; persistentVolumeClaim.claimName = "actualbudget-volume"; }
        ];
        containers = [
          {
            name = "actualbudget";
            image = "actualbudget/actual-server:latest";
            imagePullPolicy = "IfNotPresent";
            ports = [
              {
                name = "ab-http";
                containerPort = 5006;
                protocol = "TCP";
              }
            ];
            volumeMounts = [
              { mountPath = "/data"; name = "actualbudget-data"; }
            ];
          }
        ];
      };
    };
  };
}
