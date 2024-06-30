{ config, lib, pkgs, modulesPath, ... }:

{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_rpi3;
  boot.kernelParams = ["console=ttyS1,115200n8"];

  boot.loader.raspberryPi = {
    enable = true;
    version = 3;
    firmwareConfig = ''
    '';
  }:

  boot.initrd.kernelModules = ["vc4" "bcm2835_dma" "i2c_bcm2835"];

  hardware.enableRedistributableFirmware = true;

  networking.wireless = {
    hostname = "laevateinn.local";
    enable = true;
    interfaces = ["wlan0"];
  };
  networking.useDHCP = lib.mkDefault true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = ["noatime"];
    };
  };
}
