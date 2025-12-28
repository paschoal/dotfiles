{  ... }:

{
  services = {
    k3s = {
      role = "agent";
      disable = [
        "metrics-server"
        "traefik"
        "servicelb"
      ];
      extraFlags = [ "--write-kubeconfig-mode 644" ];
      serverAddr = "https://192.168.2.20:6443";
    };
  };
}
