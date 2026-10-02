{ pkgs, lib, ... }:

{
  common.localization = "America/Sao_Paulo";

  imports = [
    ./hardware.nix
    ./audio.nix
    ./network.nix
    ./home.nix

    ../../nixos/common

    ../../nixos/graphical/sddm
    ../../nixos/graphical/niri

    ../../nixos/virtualisation/docker
    ../../nixos/services/postgresql
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.dconf.enable = true;

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "input"];
    shell = pkgs.fish;
  };

  security = {
    rtkit.enable = true;
    sudo = {
      wheelNeedsPassword = false;
    };
  };

  services = {
    udisks2.enable = true;
    upower.enable = true;
    journald.storage = "volatile";
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-kernel-modules"
    "nvidia-persistenced"
  ];

  system.stateVersion = "26.05";
}

