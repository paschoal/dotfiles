{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  imports = [
  	(modulesPath + "/installer/scan/not-detected.nix")
  ];

  powerManagement.enable = true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot.initrd.availableKernelModules = [
  	"xhci_pci"
	"thunderbolt"
	"nvme" 
	"usb_storage"
	"sd_mod"
	"rtsx_pci_sdmmc"
  ];

  boot.initrd.kernelModules = [ ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelModules = [ "kvm-intel" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = [ ];

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

  hardware.bluetooth = {
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
}
