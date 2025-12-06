{
  apiVersion = "v1";
  kind = "PersistentVolumeClaim";
  metadata = {
    name = "pihole-storage";
    labels.app = "pihole";
  };
  spec = {
    accessModes = [ "ReadWriteOnce" ];
    resources.requests.storage = "500Mi";
  };
}
