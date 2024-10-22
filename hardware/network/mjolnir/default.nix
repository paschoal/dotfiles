{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ethtool];
}
