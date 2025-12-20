{ pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      <agenix/modules/age.nix>

      ./hardware.nix
      ./network.nix

      ../../common
      ../../services/openssh
      ../../services/klipper
    ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    createHome = true;
    home = "/data/home";
  };

  services.openssh.settings.AllowUsers = [ "paschoal" ];

  security = {
    polkit.enable = true;

    sudo = {
      wheelNeedsPassword = false;
    };
  };

  environment.systemPackages = [
    (pkgs.callPackage <agenix/pkgs/agenix.nix> {})
  ];

  system.stateVersion = "24.05";
}

