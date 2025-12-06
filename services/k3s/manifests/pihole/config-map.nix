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
    tz = "America/New_York";
    forward-addr = "9.9.9.9;149.112.112.112";
    listening-mode = "all";
  };
}
