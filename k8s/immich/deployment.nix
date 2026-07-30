{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "immich-deployment";
    labels.app = "immich";
  };
  spec = {
    selector.matchLabels.app = "immich";
    template = {
      metadata.labels.app = "immich";
      spec = {
        volumes = [
          { name = "immich-data"; persistentVolumeClaim.claimName = "immich-data"; }
          { name = "photos"; hostPath = { path = "/storage/photos"; type = "Directory"; }; }
        ];
        containers = [
          {
            name = "immich";
            image = "ghcr.io/imagegenius/immich:latest";
            imagePullPolicy = "IfNotPresent";
            ports = [
              {
                name = "immich-http";
                containerPort = 8080;
                protocol = "TCP";
              }
            ];
            envFrom = [
              { configMapRef.name = "immich-env"; }
            ];
            volumeMounts = [
              { name = "immich-data"; mountPath = "/config"; }
              { name = "photos"; mountPath = "/photos"; }
            ];
          }
        ];
      };
    };
  };
}
