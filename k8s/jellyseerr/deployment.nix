{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata.name = "jellyseerr";
  metadata.labels.app = "jellyseerr";
  spec = {
    replicas = 1;
    selector.matchLabels.app = "jellyseerr";
    template = {
      metadata.labels.app = "jellyseerr";
      spec = {
        volumes = [
          { name = "jellyseerr-config"; persistentVolumeClaim.claimName = "jellyseerr-config"; }
        ];
        containers = [
          {
            name = "jellyseerr";
            image = "ghcr.io/fallenbagel/jellyseerr:latest";
            imagePullPolicy = "IfNotPresent";
            # resources = {
            #   limits.memory = "";
            #   limits.cpu = "";
            #   requests.memory = "";
            #   request.cpu = "";
            # };
            envFrom = [
              { configMapRef.name = "jellyseerr-env"; }
            ];
            ports = [
              { name = "jellyseerr-http"; containerPort = 5055; protocol = "TCP"; }
            ];
            volumeMounts = [
              { name = "jellyseerr-config"; mountPath = "/app/config"; }
            ];
          }
        ];
      };
    };
  };
}
