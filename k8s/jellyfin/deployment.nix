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
        securityContext = {
          fsGroup = 1000;
        };
        volumes = [
          { name = "media"; persistentVolumeClaim.claimName = "media"; }
          { name = "jellyfin-config"; persistentVolumeClaim.claimName = "jellyfin-config"; }
        ];
        containers = [
          {
            name = "jellyfin";
            image = "lscr.io/linuxserver/jellyfin:latest";
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
            ];
          }
        ];
      };
    };
  };
}
