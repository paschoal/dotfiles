{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  hardware.graphics.enable = true;

  boot = {
    supportedFilesystems = [ "nfs" ];
    initrd = {
      kernelModules = [];
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "ehci_pci"
        "usb_storage"
        "sd_mod"
      ];
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "kvm-amd" "dm-crypt" ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
  users.users.paschoal.extraGroups = [ "kvm" ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d4521fbd-9767-44f2-a137-3a5a9016e450";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DB98-DE32";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/storage" = {
    device = "/dev/disk/by-uuid/02889669-0077-402e-8e16-34cf33649203";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/0d32a2b8-927b-4502-9088-302cbbb2dd76"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
