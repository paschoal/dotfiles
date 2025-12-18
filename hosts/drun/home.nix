{ pkgs, ... }:

{
  imports = [
    ../../config/git
    ../../config/fish
    ../../config/nvim/minimal.nix
  ];

  git-config.sign-gpg = false;

  home = {
    username = "paschoal";
    homeDirectory = "/data/home";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [
      bat
      unzip
    ];
  };

  programs.home-manager.enable = true;
  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    store.cleanup = true;
  };
}
