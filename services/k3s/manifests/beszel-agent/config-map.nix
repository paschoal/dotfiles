{
  apiVersion = "v1";
  kind = "ConfigMap";
  metadata = {
    name = "beszel-agent-env";
    labels = {
      app = "beszel-agent";
    };
  };
  data = {
    HUB_URL = "https://tlm.paschoal.me";
    KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr7g4EdWG+yOMKAdJF5Fwmt9FHWJHiUX8PJMocUhDxC";
    LISTEN = "45876";
  };
}
