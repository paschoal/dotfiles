{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "beszel-volume";
    labels.app = "beszel";
  };
  spec = {
    accessModes = [ "ReadWriteOncePod" ];
    resources.requests.storage = "1Gi";
    storageClassName = "";
    selector.matchLabels.app = "beszel";
  };
}
