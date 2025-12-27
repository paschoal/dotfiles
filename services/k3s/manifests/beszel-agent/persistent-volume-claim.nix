{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "beszel-agent-volume";
    labels.app = "beszel-agent";
  };
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    resources.requests.storage = "500Mi";
    storageClassName = "";
    selector.matchLabels.app = "beszel-agent";
  };
}
