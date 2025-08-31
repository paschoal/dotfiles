{ config, lib, pkgs, modulesPath, ... }:
{
  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
    kernelParams = [
      "console=ttyS0,115200n8"
      "console=tty0"
    ];
    kernelModules = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [
    {
      device = "/.swap";
      size = 2 * 1024;
    }
  ];

  environment.systemPackages = with pkgs; [ libraspberrypi ];
  nixpkgs.hostPlatform = "aarch64-linux";
}

