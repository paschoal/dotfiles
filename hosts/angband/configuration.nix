{ pkgs, ... }:

{
  common.localization = "America/Sao_Paulo";

  imports = [
    ./hardware.nix
    ./audio.nix
    ./network.nix
    ./home.nix

    ../../nixos/common
    ../../nixos/graphical/niri
    ../../nixos/virtualisation/docker
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.dconf.enable = true;
  services.lorri.enable = true;

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
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  system.stateVersion = "26.05";
}

