let
  buildService = import ../support/builder/service;
in buildService {
  name = "ealen-http";
  app = "ealen";
  ports = [
    { name = "ealen-http"; protocol = "TCP"; port = 80; }
  ];
}
