{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "bazarr";
    labels.app = "bazarr";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "bazarr";
    strategy.type = "Recreate";
    template = {
      metadata.labels.app = "bazarr";
      spec = {
        securityContext.fsGroup = 1000;
        volumes = [
          { name = "media"; persistentVolumeClaim.claimName = "media"; }
          { name = "bazarr-config"; persistentVolumeClaim.claimName = "bazarr-config"; }
        ];
        containers = [
          {
            name = "bazarr";
            image = "lscr.io/linuxserver/bazarr:latest";
            imagePullPolicy = "IfNotPresent";
            envFrom = [
              { configMapRef.name = "bazarr-env"; }
            ];
            ports = [
              { name = "bazarr-http"; containerPort = 6767; protocol = "TCP"; }
            ];
            volumeMounts = [
              { name = "bazarr-config"; mountPath = "/config"; }
              { name = "media"; mountPath = "/media"; }
            ];
          }
        ];
      };
    };
  };
}
