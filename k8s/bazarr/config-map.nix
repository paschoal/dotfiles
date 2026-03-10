let
  buildConfigMap = import ../support/builder/config-map;

in buildConfigMap {
  name = "bazarr-env";
  app = "bazarr" ;
  data = {
    TZ = "America/New_York";
    PUID = "1000";
    PGID = "1000";
  };
}
