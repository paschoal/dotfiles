{ config, pkgs, ... }:

{
  config = {
    home.sessionVariables = {
      AWS_VAULT_BACKEND = "file";
      AWS_VAULT_FILE_DIR = "$HOME/.aws/vault/keys";
      AWS_DEFAULT_REGION = "us-east-1";
    };

    home.packages = with pkgs; [
      aws-vault
      awscli2
    ];
  };
}
