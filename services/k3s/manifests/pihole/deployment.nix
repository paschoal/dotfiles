{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "pihole";
    labels.app = "pihole";
  };
  spec = {
    replicas = 1;
    selector.matchLabels.app = "pihole";
    strategy.type = "RollingUpdate";
    strategy.rollingUpdate = {
      maxSurge = 1;
      maxUnavailable = 1;
    };
    template = {
      metadata.labels.app = "pihole";
      spec = {
        volumes = [
          {
            name = "pihole-storage";
            persistentVolumeClaim.claimName = "pihole-storage";
          }
        ];
        containers = [
          {
            name = "pihole";
            image = "pihole/pihole";
            imagePullPolicy = "IfNotPresent";
            envFrom = [
              { configMapRef.name = "pihole-env"; }
            ];
            resources = {
              limits.memory = "1Gi";
              limits.cpu = "2";
              requests.memory = "512Mi";
              requests.cpu = "1";
            };
            ports = [
              {
                name = "pihole-http";
                containerPort = 80;
                protocol = "TCP";
              }
              {
                name = "pihole-dns";
                containerPort = 53;
                protocol = "TCP";
              }
              {
                name = "pihole-dns-udp";
                containerPort = 53;
                protocol = "UDP";
              }
              {
                name = "pihole-dhcp";
                containerPort = 67;
                protocol = "UDP";
              }
            ];
            volumeMounts = [
              { mountPath = "/etc/pihole"; name = "pihole-storage"; }
            ];
          }
        ];
      };
    };
  };
}
