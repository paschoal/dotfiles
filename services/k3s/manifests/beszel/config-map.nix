{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "beszel-env";
    labels.app = "beszel";
  };
  data = {
    AUTO_LOGIN = "u@paschoal.me";
  };
}
