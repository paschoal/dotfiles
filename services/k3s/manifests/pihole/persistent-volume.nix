{
  apiVersion = "v1";
  kind = "PersistentVolume";
  metadata = {
    name = "pihole-volume";
    labels.app = "pihole";
  };
  spec = {
    capacity.storage = "2Gi";
    accessModes = [ "ReadWriteOncePod" ];
    persistentVolumeReclaimPolicy = "Retain";
    hostPath = {
      path = "/etc/pihole";
      type = "DirectoryOrCreate";
    };
  };
}
