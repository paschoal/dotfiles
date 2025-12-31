{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata.name = "beszel-volume";
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    resources.requests.storage = "1Gi";
    storageClassName = "nvme";
  };
}
