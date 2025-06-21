{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ headphones-toolbox ];
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="fedd", MODE="666"
  '';
}
