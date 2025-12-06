{
  apiVersion = "networking.k8s.io/v1";
  kind = "Ingress";
  metadata = {
    name = "pihole-ingress";
    labels.app = "pihole";
  };
  spec = {
    ingressClassName = "traefik";
    rules = [
      {
        host = "pihole.local"
        http.paths = [
          {
            pathType = "Prefix";
            path = "/";
            backend.service = {
              name = "pihole-http";
              port.number = 80;
            };
          }
        ];
      }
    ];
  };
}
