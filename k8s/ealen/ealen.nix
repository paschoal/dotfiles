{
  app = "ealen";
  metadata = {
    name = "ealen";
  };
  container = {
    image = "ealen/echo-server:latest";
    ports = [
      { port = 80; name = "ealen-http"; protocol = "TCP"; }
    ];
  };
}
