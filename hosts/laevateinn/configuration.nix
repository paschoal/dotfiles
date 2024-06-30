{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix

    ../../common
  ];

  nix.settings.experimental-features = [
    "nix-command"
  ];

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = [];
    shell = pkgs.zsh;
    createHome = true;
    home = "/data/home";
  };

  security = {
    rtkit.enable = true;
    sudo = {
      wheelNeedsPassword = true;
    };
  };

  services.openssh.enable = true;
  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = "24.05";
}
