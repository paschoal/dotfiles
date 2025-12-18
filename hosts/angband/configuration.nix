{ pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    <agenix/modules/age.nix>

    ./hardware.nix
    ./network.nix

    ../../common
    ../../locale
    ../../graphical/bspwm

    ../../services/beszel-agent

    ../../virtualisation/podman
  ];

  nix.settings.experimental-features = [ "nix-command" ];

  programs.dconf.enable = true;

  users.users.paschoal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "input" ];
    shell = pkgs.fish;
    createHome = true;
    home = "/data/home";
  };

  security = {
    rtkit.enable = true;

    sudo = {
      wheelNeedsPassword = false;
    };
  };

  environment.systemPackages = [
    (pkgs.callPackage <agenix/pkgs/agenix.nix> {})
  ];

  services = {
    upower.enable = true;
  };

  system.stateVersion = "24.05";
}
