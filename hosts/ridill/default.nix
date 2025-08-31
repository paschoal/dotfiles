{ config, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
    ./configuration.nix
  ];

  sdImage = {
    compressImage = false;
  };
}

# generate sd-image using
# $ nixos-generate -f sd-aarch64-installer --system aarch64-linux -c default.nix
