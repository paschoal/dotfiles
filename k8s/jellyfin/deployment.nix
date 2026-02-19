{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "jellyfin";
    labels.app = "jellyfin";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "jellyfin";
    strategy.type = "Recreate";
    template = {
      metadata.labels.app = "jellyfin";
      spec = {
        volumes = [
          { name = "media"; persistentVolumeClaim.claimName = "media"; }
          { name = "jellyfin-config"; persistentVolumeClaim.claimName = "jellyfin-config"; }
          { name = "jellyfin-cache"; persistentVolumeClaim.claimName = "jellyfin-cache"; }
          { name = "dri-0"; hostPath = { path = "/dev/dri/card0"; }; }
          { name = "dri-d128"; hostPath = { path = "/dev/dri/renderD128"; }; }
        ];
        containers = [
          {
            name = "jellyfin";
            image = "jellyfin/jellyfin:latest";
            imagePullPolicy = "IfNotPresent";
            securityContext = {
              privileged = true;
            };
            ports = [
              { name = "jellyfin-http"; containerPort = 8096; protocol = "TCP"; }
              { name = "jellyfin-udp"; containerPort = 7359; protocol = "UDP"; }
            ];
            volumeMounts = [
              { name = "media"; mountPath = "/media"; }
              { name = "jellyfin-config"; mountPath = "/config"; }
              { name = "jellyfin-cache"; mountPath = "/cache"; }
              { name = "dri-0"; mountPath = "/dev/dri/card0"; }
              { name = "dri-d128"; mountPath = "/dev/dri/renderD128"; }
            ];
          }
        ];
      };
    };
  };
}
