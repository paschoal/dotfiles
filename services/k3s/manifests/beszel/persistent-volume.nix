{
  apiVersion = "v1";
  kind = "PersistentVolume";
  metadata = {
    name = "beszel-volume";
    labels.app = "beszel";
  };
  spec = {
    capacity.storage = "1Gi";
    accessModes = [ "ReadWriteOncePod" ];
    persistentVolumeReclaimPolicy = "Retain";
    hostPath = {
      path = "/var/lib/beszel";
      type = "DirectoryOrCreate";
    };
  };
}
