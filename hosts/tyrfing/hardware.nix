{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    <nixos-hardware/raspberry-pi/4>
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  hardware = {
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    deviceTree = {
      enable = true;
      filter = "*rpi-4-*.dtb";
      dtboBuildExtraIncludePaths = [
        ./overlays
      ];
      overlays = [
        {
          name = "imx219-overlay";
          dtsFile = ./overlays/imx219-overlay.dts;
        }
      ];
    };
  };

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
    initrd = {
      availableKernelModules = [ "usbhid" ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
    fsType = "ext4";
  };

  swapDevices = [ ];

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
  ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
