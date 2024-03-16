{ pkgs, environment, services, programs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    gnupg
    git
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
}
