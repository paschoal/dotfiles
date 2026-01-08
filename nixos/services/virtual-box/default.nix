{ ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };

  users.users.paschoal = {
    extraGroups = ["vboxusers"];
  };
}
