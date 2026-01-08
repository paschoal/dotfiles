{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "pihole-env";
    labels = {
      app = "pihole";
    };
  };
  data = {
    TZ = "America/New_York";
    FTLCONF_DNS_UPSTREAMS = "1.1.1.1;1.0.0.1";
    FTLCONF_DNS_LISTENINGMODE = "all";
  };
}
