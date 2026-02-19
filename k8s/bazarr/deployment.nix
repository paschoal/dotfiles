let
  buildDeployment = import ../support/builder/deployment;

in buildDeployment {
  app = "bazarr";
  image = "lscr.io/linuxserver/bazarr:latest";
  configMapName = "bazarr-env";
  ports = [
    { port = 6767; name = "bazarr-http"; protocol = "TCP"; }
  ];
  volumes = [
    { name = "bazarr-config"; claim = "bazarr-config"; path = "/config"; }
    { name = "media"; claim = "media"; path = "/media"; }
  ];
}
