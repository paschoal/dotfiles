let
  buildDeployment = import ../support/builder/deployment;
in buildDeployment {
  app = "ealen";
  image = "ealen/echo-server:latest";
  ports = [
    { port = 80; name = "ealen-http"; protocol = "TCP"; }
  ];
}
