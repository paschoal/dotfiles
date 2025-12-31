{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "caddy-caddyfile";
    labels.app = "caddy";
  };
  data =  {
    "Caddyfile" = ''
      {
        email paschoal@gmail.com
        storage file_system /opt/caddy
      }

      dns.paschoal.me {
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

      tlm.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy beszel-http.default.svc.cluster.local {
          transport http {
            read_timeout 360s
          }
        }
      }

      lh.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy 10.43.118.207:80
      }

      :80 {
        respond "pong"
      }
    '';
  };
}
