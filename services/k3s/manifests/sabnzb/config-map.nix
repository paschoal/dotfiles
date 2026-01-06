{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "sabnzb-env";
    labels.app = "sabnzb";
  };
  data = {
    TZ = "America/New_York";
    PUID = "1000";
    PGID = "1000";
  };
}
