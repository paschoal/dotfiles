{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "vaultwarden-env";
    labels.app = "vaultwarden";
  };
  data = {
    DOMAIN = "https://vw.paschoal.me";
  };
}
