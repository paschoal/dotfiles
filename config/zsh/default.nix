{ config, pkgs, ... }:

{
  imports = [
    ../liquidprompt
  ];

  config = {
    programs = {
      zsh = {
        enable = true;
        shellAliases = {
          cat = "bat";
          nixos-rebuild = "nixos-rebuild --use-remote-sudo";
        };

        plugins = [
          {
            name = "liquidprompt";
            file = "liquidprompt";
            src = pkgs.fetchFromGitHub {
              owner = "liquidprompt";
              repo = "liquidprompt";
              rev = "v2.1.2";
              sha256 = "sha256-7mnrXLqnCdOuS2aRs4tVLfO8SRFrqZHNM40gWE/CVFI=";
            };
          }
        ];
      };
    };
  };
}
