{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ../../audio/mjolnir
    ../../hardware/radeon
    ../../hardware/tartarus
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
  boot.kernelParams = ["video=DP-3:2560x1440@150"];

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
  # mouse & keyboard
  #
  hardware.ckb-next.enable = true;

  #
  # monitor configuration
  #
  services.xserver = {
    xrandrHeads = [
      {
        output = "HDMI-A-0";
        monitorConfig = ''
          Modeline "1920x1080@60" 148.50 1920 2008 2052 2200 1080 1084 1089 1125 +hsync +vsync
          Option "PreferredMode" "1920x1080@60"
          Option "Rotate" "right"
          Option "LeftOf" "DisplayPort-2"
        '';
      }

      {
        output = "DisplayPort-2";
        primary = true;
        monitorConfig = ''
          Modeline "2560x1440@150" 612.61 2560 2568 2600 2640 1440 1443 1453 1547 +hsync +vsync
          Option "PreferredMode" "2560x1440@150"
          Option "RightOf" "HDMI-A-0"
        '';
      }
    ];
  };
}
