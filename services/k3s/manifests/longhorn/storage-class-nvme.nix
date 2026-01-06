{
  apiVersion = "storage.k8s.io/v1";
  kind = "StorageClass";
  metadata = {
    name = "nvme";
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true";
    };
  };
  provisioner = "driver.longhorn.io";
  reclaimPolicy = "Delete";
  volumeBindingMode = "Immediate";
  allowVolumeExpansion = true;
  parameters = {
    backupTargetName = "default";
    dataEngine = "v1";
    fsType = "ext4";
    numberOfReplicas = "2";
    staleReplicaTimeout = "30";
    diskSelector = "nvme";
  };
}
