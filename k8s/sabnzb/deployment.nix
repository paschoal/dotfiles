{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "sabnzb";
    labels.app = "sabnzb";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "sabnzb";
    strategy.type = "Recreate";
    template = {
      metadata.labels.app = "sabnzb";
      spec = {
        securityContext.fsGroup = 1000;
        volumes = [
          { name = "media"; persistentVolumeClaim.claimName = "media"; }
          { name = "sabnzb-config"; persistentVolumeClaim.claimName = "sabnzb-config"; }
        ];
        containers = [
          {
            name = "sabnzbd";
            image = "lscr.io/linuxserver/sabnzbd:latest";
            imagePullPolicy = "IfNotPresent";
            envFrom = [
              { configMapRef.name = "sabnzb-env"; }
            ];
            ports = [
              { name = "sabnzb-http"; containerPort = 8080; protocol = "TCP"; }
            ];
            volumeMounts = [
              { name = "sabnzb-config"; mountPath = "/config"; }
              { name = "media"; mountPath = "/incomplete-downloads"; subPath = "incomplete"; }
              { name = "media"; mountPath = "/downloads"; subPath = "downloads"; }
            ];
          }
        ];
      };
    };
  };
}
