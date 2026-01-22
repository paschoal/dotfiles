{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "heimdall-env";
    labels.app = "heimdall";
  };
  data = {
    TZ = "America/New_York";
    PUID = "1000";
    PGID = "1000";
    ALLOW_INTERNAL_REQUESTS = "false";
  };
}
