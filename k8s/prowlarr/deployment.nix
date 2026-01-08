{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "prowlarr";
    labels.app = "prowlarr";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "prowlarr";
    strategy.type = "Recreate";
    template = {
      metadata.labels.app = "prowlarr";
      spec = {
        securityContext.fsGroup = 1000;
        volumes = [
          { name = "prowlarr-config"; persistentVolumeClaim.claimName = "prowlarr-config"; }
        ];
        containers = [
          {
            name = "prowlarr";
            image = "lscr.io/linuxserver/prowlarr:latest";
            imagePullPolicy = "IfNotPresent";
            envFrom = [
              { configMapRef.name = "prowlarr-env"; }
            ];
            ports = [
              { name = "prowlarr-http"; containerPort = 9696; protocol = "TCP"; }
            ];
            volumeMounts = [
              { name = "prowlarr-config"; mountPath = "/config"; }
            ];
          }
        ];
      };
    };
  };
}
