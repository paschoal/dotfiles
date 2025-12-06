{
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = "ealen-deployment";
    labels.apps = "ealen";
  };
  spec = {
    selector.matchLabels.app = "ealen"; 
    template = {
      metadata.labels.app = "ealen";
      spec = {
        containers = [
          {
            name = "ealen";
            image = "ealen/echo-server:latest";
            ports = [
              {
                name = "ealen-http";
                containerPort = 80;
                protocol = "TCP";
              }
            ];
            resources = {
              limits.memory = "256Mi";
              limits.cpu = "200m";
              requests.memory = "128Mi";
              requests.cpu = "100m";
            };
            readinessProbe.httpGet = { path = "/"; port = "ealen-http"; };
            livenessProbe.httpGet = { path = "/"; port = "ealen-http"; };
          }
        ];
      };
    };
  };
}
