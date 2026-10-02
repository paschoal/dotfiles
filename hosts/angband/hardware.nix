{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  imports = [
  	(modulesPath + "/installer/scan/not-detected.nix")
  ];

  powerManagement.enable = true;

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  fileSystems."/" = {
  	device = "/dev/disk/by-uuid/d0ab38ec-2058-464a-ba69-cdb194015ab6";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
  	device = "/dev/disk/by-uuid/4CFC-8BCD";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
  	{ device = "/dev/disk/by-uuid/64c0d057-fdf4-437e-8536-dfa28d0aea21"; }
  ];

  services.xserver.videoDrivers = [ "modesetting" ];

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = false;
        };
        Policy.AutoEnable = true;
      };
    };
    graphics.enable = true;
    nvidia = {
      prime = {
        intelBusId= "PCI:0@0:2:0";
        nvidiaBusId = "PCI:1@0:0:0";
      };
      open = true;
      modesetting.enable = true;
    };
  };
}
