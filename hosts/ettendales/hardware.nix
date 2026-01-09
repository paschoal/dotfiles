{ lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "usbhid" ];
  boot.initrd.kernelModules = [];

  boot.kernelParams = [
    "console=ttyS1,115200n8"
  ];

  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
    fsType = "ext4";
  };

  swapDevices = [
    {
      device = "/.swap";
      size = 1024 * 4;
    }
  ];

  environment.systemPackages = with pkgs; [
    libraspberrypi
  ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
