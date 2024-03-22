{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ../../audio/mjolnir
  ];

  #
  # cpu
  #
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  #
  # kernel
  #
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];

  #
  # graphical
  #
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelParams = ["video=DP-3:2560x1440@144" "video=HDMI-A-1:1920x1080@60"];

  #
  # bootload
  #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #
  # virtualisation
  #
  boot.kernelModules = [ "kvm-amd" ];
  virtualisation.docker.enable = true;

  #
  # disks
  #
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  #
  # network
  #
  networking.useDHCP = lib.mkDefault true;
  networking.hostName = "mjolnir";

  #
  # mouse
  #
  environment.systemPackages = with pkgs; [
    ckb-next
  ];
  hardware.ckb-next.enable = true;

  #
  # QMK
  #
  hardware.keyboard.qmk.enable = true;
}
