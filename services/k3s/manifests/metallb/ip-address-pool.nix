{
  apiVersion = "metallb.io/v1beta1";
  kind = "IPAddressPool";
  metadata = {
    name = "ip-pool";
    namespace = "metallb-system";
  };
  spec.addresses = [
    "192.168.2.10-192.168.2.19"
  ];
}
