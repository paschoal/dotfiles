{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "sonarr-env";
    labels.app = "sonarr";
  };
  data = {
    TZ = "America/New_York";
    PUID = "1000";
    PGID = "1000";
  };
}
