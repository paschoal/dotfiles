{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "vaultwarden-volume";
    labels.app = "vaultwarden";
  };
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    resources.requests.storage = "2Gi";
    storageClassName = "nvme";
  };
}
