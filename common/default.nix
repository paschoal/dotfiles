{ pkgs, environment, services, programs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    gnupg
    pinentry-gtk2
  ];

  services.pcscd.enable = true;

  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gtk2;
    };
    git = {
      enable = true;
      lfs.enable = true;
    };
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than=7d";
    };
  };
}
