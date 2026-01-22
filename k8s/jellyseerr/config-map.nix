{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "jellyseerr-env";
    labels.app = "jellyseerr";
  };
  data = {
    TZ = "America/New_York";
    LOG_LEVEL = "info";
  };
}
