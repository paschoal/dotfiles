{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ../../audio/mjolnir
    ../../hardware/headphones
    ../../hardware/radeon
    ../../hardware/raid/mjolnir
    ../../hardware/network/mjolnir
  ];

  #
  # power
  #
  environment.extraInit = ''
    xset s off -dpms
  '';

  #
  # raid
  #
  environment.systemPackages = [
    pkgs.mdadm
  ];

  #
  # cpu
  #
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  #
  # gpu
  #
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelParams = [
    "video=DP-3:2560x1440@150"
    "raid0.default_layout=2"
  ];

  #
  # boot kernel params for amd
  # overdrive support
  #
  # "amdgpu.ppfeaturemask=0xffffffff"

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
  # bootload
  #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #
  # virtualisation
  #
  boot.kernelModules = [ "kvm-amd" ];

  #
  # using latest kernel instead of LTS
  #
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #
  # add aarch64 to support building remotely to
  # raspberry pis.
  #
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  users.users.paschoal = {
    extraGroups = [ "kvm" ];
  };

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
    options = [ "fmask=0077" "dmask=0077" "defaults" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  #
  # monitor configuration
  #
  services.xserver = {
    xrandrHeads = [
      {
        output = "DisplayPort-2";
        primary = true;
        monitorConfig = ''
          Modeline "2560x1440@150" 612.61 2560 2568 2600 2640 1440 1443 1453 1547 -hsync -vsync
          Option "PreferredMode" "2560x1440@150"
        '';
      }
    ];
  };
}
