{ pkgs, ... }:

{
  imports = [ ./dbeaver ];

  home.packages = with pkgs; [
    #
    # language servers for nvim
    #
    nil

    postgresql
    (
      google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
      ]
    )

    kubernetes
    sops
    hurl
    helmfile
    (
      wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-git
        ];
      }
    )
    dia
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
