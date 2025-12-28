{
  apiVersion = "v1";
  kind = "PersistentVolume";
  metadata = {
    name = "caddy-volume";
    labels.app = "caddy";
  };
  spec = {
    capacity.storage = "500Mi";
    accessModes = [ "ReadWriteOncePod" ];
    persistentVolumeReclaimPolicy = "Retain";
    hostPath = {
      path = "/opt/caddy";
      type = "DirectoryOrCreate";
    };
  };
}
