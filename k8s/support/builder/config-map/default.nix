{
  name,
  app,
  data
}: {
  inherit data;
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    inherit name;
    labels.app = app;
  };
}
