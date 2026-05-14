{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "radarr-env";
    labels.app = "radarr";
  };
  data = {
    TZ = "America/New_York";
    PUID = "1000";
    PGID = "1000";
  };
}
