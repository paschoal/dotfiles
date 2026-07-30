{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "immich-env";
    labels.app = "immich";
  };
  data = {
    PUID = "1000";
    PGID = "1000";
    TZ = "America/New_York";
    DB_HOSTNAME = "sql";
    DB_USERNAME = "postgres";
    DB_PASSWORD = "postgres";
    DB_DATABASE_NAME = "immich";
    REDIS_HOSTNAME = "valkey";
    IMMICH_MACHINE_LEARNING_ENABLEd = "false";
  };
}
