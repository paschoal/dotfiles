{ ... }:
{
  services.beszel.agent = {
    enable = true;
    environment = {
      LISTEN = "45876";
      HUB_URL = "https://beszel.paschoal.me";
      KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPI+aLbYT9LI+ex3nm7Gk0ui3gTAWbfuX5jjQHljQcOy";
    };
    openFirewall = true;
  };
}
