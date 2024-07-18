{ config, lib, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = ["paschoal"];
      UseDns = true;
      PermitRootLogin = "no";
    };
  };
}
