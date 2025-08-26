{ config, pkgs, lib, ... }:

{
  options = {
    git-config = {
      sign-gpg = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Sign git commits with GPG key
        '';
      };
    };
  };

  config.programs.git = {
    enable = true;
    userName = "Matheus Paschoal";
    userEmail = "paschoal@gmail.com";
    extraConfig = lib.mkMerge [
      {
        rerere.enabled = true;
        color = {
          ui = true;
          pager = true;
        };
      }

      (
        lib.mkIf config.git-config.sign-gpg {
          user.signingKey = "734F62B31D556B2D";
          commit.gpgsign = true;
        }
      )
    ];
  };
}
