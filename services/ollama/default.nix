{ lib, pkgs, nixpkgs, environment, config, options, specialArgs, modulesPath, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

  services.open-webui = {
    enable = true;
  };

  #
  # avoiding using nix-ld for now
  # since affect system wide.
  # programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [ uv goose-cli ];

  #
  # disable for running it by default; trigger it on demand.
  #
  systemd.services.ollama.wantedBy = lib.mkForce [];
  systemd.services.open-webui.wantedBy = lib.mkForce [];
}
