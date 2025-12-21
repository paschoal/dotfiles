{
  apiVersion = "apps/v1";
  kind = "DaemonSet";
  metadata = {
    name = "beszel-agent-daemon-set";
    labels.app = "beszel-agent";
  };
  spec = {
    selector.matchLabels.app = "beszel-agent";
    template = {
      metadata.labels.app = "beszel-agent";
      spec = {
        hostNetwork = true;
        containers = [
          {
            name = "beszel-agent";
            image = "henrygd/beszel-agent";
            imagePullPolicy = "IfNotPresent";
            resources = {
              limits.memory = "32Mi";
              limits.cpu = "0.1";
              requests.memory = "16Mi";
              requests.cpu = "0.1";
            };
            volumeMounts = [
              { mountPath = "/var/lib/beszel-agent"; name = "beszel-agent-data"; }
            ];
            ports = [
              { containerPort = 45876; protocol = "TCP"; name = "beszel-agent"; }
            ];
            env = [
              { name = "HUB_URL"; value = "https://beszel.paschoal.me"; }
              { name = "KEY"; value = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPI+aLbYT9LI+ex3nm7Gk0ui3gTAWbfuX5jjQHljQcOy"; }
              { name = "LISTEN"; value = "45876"; }
            ];
          }
        ];
        restartPolicy = "Always";
        tolerations = [
          { effect = "NoSchedule"; key = "node-role.kubernetes.io/master"; operator = "Exists"; }
          { effect = "NoSchedule"; key = "node-role.kubernetes.io/control-plane"; operator = "Exists"; }
        ];
        volumes = [
          {
            name = "beszel-agent-data";
            persistentVolumeClaim.claimName = "beszel-agent-data";
          }
        ];
      };
    };
    updateStrategy = {
      rollingUpdate = {
        maxSurge = 0;
        maxUnavailable = "100%";
      };
    };
  };
}
