{ config, lib, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      X11Forwarding = false;
      X11UseLocalhost = false;
      PasswordAuthentication = false;
      AllowUsers = [ "paschoal" ];
      UseDns = true;
      PermitRootLogin = "no";
    };
  };
}
