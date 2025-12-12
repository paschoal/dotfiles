{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "caddy-caddyfile";
    labels.app = "caddy";
  };
  data =  {
    "Caddyfile" = ''

      pihole.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy pihole-http.default.svc.cluster.local
      }

      vw.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy vaultwarden-http.default.svc.cluster.local
      }
    '';
  };
}
