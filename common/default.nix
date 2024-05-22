{ pkgs, environment, services, programs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    gnupg
    git
    pinentry-curses
  ];

  services = {
    pcscd = {
      enable = true;
    };
  };

  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than= 7d";
    };
  };
}
