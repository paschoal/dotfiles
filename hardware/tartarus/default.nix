{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    input-remapper
  ];

  services.input-remapper = {
    enable = true;
    enableUdevRules = true;
  };
}
