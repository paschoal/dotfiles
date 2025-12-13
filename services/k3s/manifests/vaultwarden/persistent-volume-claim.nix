{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "vaultwarden-data";
    labels.app = "vaultwarden";
  };
  spec = {
    accessModes = [ "ReadWriteOncePod" ];
    resources.requests.storage = "2Gi";
    storageClassName = "";
    selector.matchLabels.app = "vaultwarden";
  };
}
