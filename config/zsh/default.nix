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

        autocd = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history = {
          append = true;
          share = true;
          ignoreDups = true;
          ignoreSpace = true;
          path = "${config.xdg.cacheHome}/zsh_history";
          size = 10000;
          save = 10000;
        };
      };
    };
  };
}
