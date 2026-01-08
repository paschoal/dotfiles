{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "postgres-volume";
  };
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    resources.requests.storage = "10Gi";
    storageClassName = "nvme";
  };
}
