{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata.name = "caddy";
  spec = {
    replicas = 1;
    selector.matchLabels.app = "caddy";
    template = {
      metadata.labels.app = "caddy";
      spec = {
        volumes = [
          { name = "caddy-caddyfile"; configMap.name = "caddy-caddyfile"; }
          { name = "caddy-volume"; persistentVolumeClaim.claimName = "caddy-volume"; }
        ];
        containers = [
          {
            name = "caddy";
            image = "ghcr.io/paschoal/caddy-route53:main";
            imagePullPolicy = "IfNotPresent";
            resources = {
              limits.memory = "512Mi";
              limits.cpu = "0.5";
              requests.memory = "128Mi";
              requests.cpu = "0.25";
            };
            env = [
              {
                name = "AWS_ACCESS_KEY_ID";
                valueFrom.secretKeyRef = { name = "caddy-secrets"; key = "accessKeyID"; };
              }
              {
                name = "AWS_SECRET_ACCESS_KEY";
                valueFrom.secretKeyRef = { name = "caddy-secrets"; key = "secretAccessKey"; };
              }
            ];
            ports = [
              { name = "caddy-http"; containerPort = 80; protocol = "TCP"; }
              { name = "caddy-tls"; containerPort = 443; protocol = "TCP"; }
              { name = "caddy-tls-udp"; containerPort = 443; protocol = "UDP"; }
            ];
            volumeMounts = [
              { name = "caddy-caddyfile"; mountPath = "/etc/caddy/Caddyfile"; subPath = "Caddyfile"; }
              { name = "caddy-volume"; mountPath = "/opt/caddy"; }
            ];
            readinessProbe = {
              httpGet = { path = "/"; port = "caddy-http"; };
              initialDelaySeconds = 30;
              periodSeconds = 30;
            };
            livenessProbe = {
              httpGet = { path = "/"; port = "caddy-http"; };
              initialDelaySeconds = 60;
              periodSeconds = 60;
            };
          }
        ];
      };
    };
  };
}
