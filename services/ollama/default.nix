{ config, pkgs, lib, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

  services.open-webui = {
    enable = false;
  };

  #
  # avoiding using nix-ld for now
  # since affect system wide.
  # programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [ uv ];

  #
  # disable for running it by default; trigger it on demand.
  #
  systemd.services.ollama.wantedBy = lib.mkForce [];
  systemd.services.open-webui.wantedBy = lib.mkForce [];
}
