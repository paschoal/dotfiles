{ ... }:
{
  imports = [
    ../openssh
  ];

  nix.settings = {
    extra-platforms = [ "aarch64-linux" ];
    trusted-users = [
      "nix-builder"
      "@wheel"
    ];
  };

  users.users.nix-builder = {
    description = "nix-builder user";
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" ];
    createHome = false;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDkDCXw1IE9uhAzJTzrbK2w3F6XUSfD/lp2ONDdNDyZ7 nix-builder@bree"
    ];
  };

  services.openssh.settings.AllowUsers = [ "nix-builder" ];
}
