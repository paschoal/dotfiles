{
  name,
  app,
  ports ? [],
  type ? "ClusterIP",
}:
let
  portMap = list: map(i: {
    inherit (i) name protocol port;
    targetPort = i.name;
  }) list;

in {
  apiVersion = "v1";
  kind = "Service";
  metadata = {
    inherit name;
    labels = { inherit app; };
  };
  spec = {
    inherit type;
    selector = { inherit app; };
    ports = portMap ports;
  };
}
