{
  apiVersion = "v1";
  kind = "PersistentVolume";
  metadata = {
    name = "beszel-agent-volume";
    labels.app = "beszel-agent";
  };
  spec = {
    capacity.storage = "500Mi";
    accessModes = [ "ReadWriteOnce" ];
    persistentVolumeReclaimPolicy = "Retain";
    hostPath = {
      path = "/var/lib/beszel-agent";
      type = "DirectoryOrCreate";
    };
  };
}
