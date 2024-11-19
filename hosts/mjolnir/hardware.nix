{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ../../audio/mjolnir
    ../../hardware/radeon
    ../../hardware/tartarus
    ../../hardware/raid/mjolnir
    ../../hardware/network/mjolnir
  ];

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

  virtualisation.docker.enable = true;
  users.users.paschoal = {
    extraGroups = ["docker"];
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
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  #
  # mouse & keyboard
  #
  hardware.ckb-next.enable = true;

  #
  # monitor configuration
  #
  services.xserver = {
    xrandrHeads = [
      {
        output = "DisplayPort-2";
        primary = true;
        monitorConfig = ''
          Modeline "2560x1440@150" 612.61 2560 2568 2600 2640 1440 1443 1453 1547 +hsync +vsync
          Option "PreferredMode" "2560x1440@150"
        '';
      }
    ];
  };
}
