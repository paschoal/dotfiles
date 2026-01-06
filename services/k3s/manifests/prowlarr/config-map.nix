{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "prowlarr-env";
    labels.app = "prowlarr";
  };
  data = {
    TZ = "America/New_York";
    PUID = "1000";
    PGID = "1000";
  };
}
