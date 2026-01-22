{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata.name = "heimdall";
  metadata.labels.app = "heimdall";
  spec = {
    replicas = 1;
    selector.matchLabels.app = "heimdall";
    template = {
      metadata.labels.app = "heimdall";
      spec = {
        volumes = [
          { name = "heimdall-config"; persistentVolumeClaim.claimName = "heimdall-config"; }
        ];
        containers = [
          {
            name = "heimdall";
            image = "lscr.io/linuxserver/heimdall:latest";
            imagePullPolicy = "IfNotPresent";
            envFrom = [
              { configMapRef.name = "heimdall-env"; }
            ];
            ports = [
              { name = "heimdall-http"; containerPort = 80; protocol = "TCP"; }
            ];
            volumeMounts = [
              { name = "heimdall-config"; mountPath = "/config"; }
            ];
          }
        ];
      };
    };
  };
}
