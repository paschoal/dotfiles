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
      pinentryFlavor = "curses";
    };
  };
}
