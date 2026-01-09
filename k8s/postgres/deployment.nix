{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata.name = "postgres";
  spec = {
    replicas = 1;
    selector.matchLabels.app = "postgres";
    template = {
      metadata.labels.app = "postgres";
      spec = {
        volumes = [
          { name = "postgres-data"; persistentVolumeClaim.claimName = "postgres-volume"; }
        ];
        containers = [
          {
            name = "postgres";
            image = "postgres:18-alpine";
            imagePullPolicy = "IfNotPresent";
            resources = {
              limits.memory = "1Gi";
              limits.cpu = "1";
              requests.memory = "256Mi";
              requests.cpu = "0.25";
            };
            envFrom = [
              { secretRef.name = "postgres-secret"; }
            ];
            ports = [
              { name = "sql"; containerPort = 5432; protocol = "TCP"; }
            ];
            volumeMounts = [
              { mountPath = "/var/lib/postgresql"; name = "postgres-data"; }
            ];
          }
        ];
      };
    };
  };
}
