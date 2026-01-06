{
  apiVersion = "storage.k8s.io/v1";
  kind = "StorageClass";
  metadata = {
    name = "sata";
  };
  provisioner = "driver.longhorn.io";
  reclaimPolicy = "Delete";
  volumeBindingMode = "Immediate";
  allowVolumeExpansion = true;
  parameters = {
    backupTargetName = "default";
    dataEngine = "v1";
    fsType = "ext4";
    numberOfReplicas = "1";
    staleReplicaTimeout = "30";
    diskSelector = "sata";
  };
}
