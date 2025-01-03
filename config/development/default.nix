{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ruby_3_3
    postgresql
    terraform
    dbeaver-bin
    (
      google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
      ]
    )
    kubernetes
    sops
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
  ];
}
