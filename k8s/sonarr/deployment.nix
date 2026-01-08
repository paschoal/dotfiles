{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "sonarr";
    labels.app = "sonarr";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "sonarr";
    strategy.type = "Recreate";
    template = {
      metadata.labels.app = "sonarr";
      spec = {
        securityContext.fsGroup = 1000;
        volumes = [
          { name = "media"; persistentVolumeClaim.claimName = "media"; }
          { name = "sonarr-config"; persistentVolumeClaim.claimName = "sonarr-config"; }
        ];
        containers = [
          {
            name = "sonarr";
            image = "lscr.io/linuxserver/sonarr:latest";
            imagePullPolicy = "IfNotPresent";
            envFrom = [
              { configMapRef.name = "sonarr-env"; }
            ];
            ports = [
              { name = "sonarr-http"; containerPort = 8989; protocol = "TCP"; }
            ];
            volumeMounts = [
              { name = "sonarr-config"; mountPath = "/config"; }
              { name = "media"; mountPath = "/media"; }
            ];
          }
        ];
      };
    };
  };
}
