{
  app,
  replicas ? 1,
  image,
  imagePullPolicy ? "IfNotPresent",
  configMapName ? null,
  strategy ? "Recreate",
  ports,
  volumes ? [],
}:
let
  portMap = list: map (i: {
    inherit (i) name protocol;
    containerPort = i.port;
  }) list;

  mountMap = list: map (i: {
    inherit (i) name;
    mountPath = i.path;
  }) list;

  volumeMap = list: map (i: {
    inherit (i) name;
    persistentVolumeClaim.claimName = i.claim;
  }) list;

  envFrom = if configMapName == null then [] else [ { configMapRef.name = configMapName; } ] ;

in {
  apiVersion = "apps/v1";
  kind = "Deployment";
  metadata = {
    name = app;
    labels.app = app;
  };
  spec = {
    inherit replicas;
    selector.matchLabels.app = app;
    strategy.type = strategy;
    template = {
      metadata.labels.app = app;
      spec = {
        securityContext.fsGroup = 1000;
        volumes = volumeMap volumes;
        containers = [
          {
            inherit image imagePullPolicy envFrom;
            name = app;
            ports = portMap ports;
            volumeMounts = mountMap volumes;
          }
        ];
      };
    };
  };
}
