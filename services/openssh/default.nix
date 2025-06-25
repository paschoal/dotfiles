{ config, lib, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = ["paschoal"];
      UseDns = true;
      PermitRootLogin = "no";
    };
  };
}
