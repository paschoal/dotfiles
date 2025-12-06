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
        reverse_proxy 10.42.0.87:80
      }
    '';
  };
}
