{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "caddy-volume";
    labels.app = "caddy";
  };
  spec = {
    accessModes = [ "ReadWriteOncePod" ];
    storageClassName = "";
    resources.requests.storage = "500Mi";
    selector.matchLabels.app = "caddy";
  };
}
