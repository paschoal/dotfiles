{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "beszel-socket";
    labels.app = "beszel";
  };
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    resources.requests.storage = "500Mi";
  };
}
