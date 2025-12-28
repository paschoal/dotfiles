{
  apiVersion = "v1";
  kind = "PersistentVolume";
  metadata = {
    name = "vaultwarden-volume";
    labels.app = "vaultwarden";
  };
  spec = {
    capacity.storage = "2Gi";
    accessModes = [ "ReadWriteOncePod" ];
    persistentVolumeReclaimPolicy = "Retain";
    hostPath = {
      path = "/opt/data";
      type = "DirectoryOrCreate";
    };
  };
}
