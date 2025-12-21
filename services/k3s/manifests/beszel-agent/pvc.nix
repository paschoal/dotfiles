{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "beszel-agent-data";
    labels.app = "beszel-agent";
  };
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    resources.requests.storage = "500Mi";
  };
}
