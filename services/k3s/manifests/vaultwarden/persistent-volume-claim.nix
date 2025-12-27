{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "vaultwarden-data";
    labels.app = "vaultwarden";
  };
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    storageClassName = "default";
    resources.requests.storage = "2Gi";
    selector.matchLabels.app = "vaultwarden";
  };
}
