{ config, lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;

    wireplumber = {
      enable = true;
      configPackages = [];
    };
  };

  users.users.paschoal = {
    extraGroups = ["audio"];
  };

  environment.systemPackages = with pkgs; [ headphones-toolbox ];
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="fedd", MODE="666"
  '';
}
