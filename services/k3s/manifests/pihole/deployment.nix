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
            env = [
              {
                name = "TZ";
                valueFrom.configMapKeyRef = {
                  name = "pihole-env";
                  key = "tz";
                };
              }
              {
                name = "FTLCONF_DNS_UPSTREAMS";
                valueFrom.configMapKeyRef = {
                  name = "pihole-env";
                  key = "forward-addr";
                };
              }
              {
                name = "FTLCONF_DNS_LISTENINGMODE";
                valueFrom.configMapKeyRef = {
                  name = "pihole-env";
                  key = "listening-mode";
                };
              }
            ];
            resources = {
              limits = {
                memory = "1Gi";
                cpu = "2";
              };
              requests = {
                memory = "512Mi";
                cpu = "1";
              };
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
            ];
            volumeMounts = [
              {
                mountPath = "/etc/pihole";
                name = "pihole-storage";
              }
            ];
          }
        ];
      };
    };
  };
}
