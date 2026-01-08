{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "bazarr-env";
    labels.app = "bazarr";
  };
  data = {
    TZ = "America/New_York";
    PUID = "1000";
    PGID = "1000";
  };
}
