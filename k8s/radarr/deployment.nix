{
  apiVersion = "apps/v1";
  kind = "Deployment";

  metadata = {
    name = "radarr";
    labels.app = "radarr";
  };

  spec = {
    replicas = 1;
    selector = {
      matchLabels.app = "radarr";
    };

    strategy.type = "Recreate";

    template = {
      metadata.labels.app = "radarr";

      spec = {
        securityContext.fsGroup = 1000;

        volumes = [
          { name = "movies"; hostPath = { path = "/storage/media/movie"; type = "Directory"; }; }
          { name = "radarr-config"; persistentVolumeClaim.claimName = "radarr-config"; }
          { name = "seedbox"; hostPath = { path = "/storage/seedbox"; type = "Directory"; }; }
        ];

        containers = [
          {
            name = "radarr";
            image = "lscr.io/linuxserver/radarr:latest";
            imagePullPolicy = "IfNotPresent";

            envFrom = [
              { configMapRef.name = "radarr-env"; }
            ];

            ports = [
              { name = "radarr-http"; containerPort = 7878; protocol = "TCP"; }
            ];

            volumeMounts = [
              { name = "radarr-config"; mountPath = "/config"; }
              { name = "movies"; mountPath = "/media/movie"; }
              { name = "seedbox"; mountPath = "/seedbox"; }
            ];
          }
        ];
      };
    };
  };
}
