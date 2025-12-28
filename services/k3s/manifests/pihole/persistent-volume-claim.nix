{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "pihole-storage";
    labels.app = "pihole";
  };
  spec = {
    accessModes = [ "ReadWriteOncePod" ];
    resources.requests.storage = "2Gi";
    storageClassName = "";
    selector.matchLabels.app = "pihole";
  };
}
