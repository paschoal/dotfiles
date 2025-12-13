{
  apiVersion = "apps/v1";
  kind = "StatefulSet";
  metadata = {
    name = "vaultwarden-set";
    labels.app = "vaultwarden";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "vaultwarden";
    template = {
      metadata.labels.app = "vaultwarden";
      spec = {
        volumes = [
          {
            name = "vaultwarden-data";
            persistentVolumeClaim.claimName = "vaultwarden-data";
          }
        ];
        containers = [
          {
            name = "vaultwaren";
            image = "vaultwarden/server:latest";
            imagePullPolicy = "IfNotPresent";
            ports = [
              {
                name = "vw-http";
                containerPort = 80;
                protocol = "TCP";
              }
            ];
            resources = {
              limits.memory = "1Gi";
              limits.cpu = "2";
              requests.memory = "512Mi";
              requests.cpu = "1";
            };
            envFrom = [
              { configMapRef.name = "vaultwarden-env"; }
            ];
            volumeMounts = [
              {
                mountPath = "/opt/vaultwarden-data";
                name = "vaultwarden-data";
              }
            ];
          }
        ];
      };
    };
  };
}
