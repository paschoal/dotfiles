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

      storage.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy nextcloud-http.default.svc.cluster.local
      }

      sonarr.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy sonarr-http.default.svc.cluster.local
      }

      prowlarr.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy prowlarr-http.default.svc.cluster.local
      }

      nzbget.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy nzbget-http.default.svc.cluster.local
      }

      sab.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy sabnzb-http.default.svc.cluster.local
      }

      jellyfin.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy jellyfin-http.default.svc.cluster.local
      }

      bazarr.paschoal.me {
        tls {
          dns route53 {
          }
        }
        reverse_proxy bazarr-http.default.svc.cluster.local
      }

      :80 {
        respond "pong"
      }
    '';
  };
}
