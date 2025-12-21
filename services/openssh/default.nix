{ ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      X11Forwarding = false;
      X11UseLocalhost = false;
      PasswordAuthentication = false;
      UseDns = false;
      PermitRootLogin = "no";
    };
    openFirewall = true;
  };
}
