{ config, lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;

      configPackages = [
        (
          pkgs.writeTextDir "share/wireplumber/main.lua.d/51-rename-alsa.lua" ''
            alsa_monitor.rules = {
              matches = {
                {{ "node.name", "equals", "alsa_output.pci-0000_2d_00.1.hdmi-stereo-extra4" }},
              };

              apply_properties = {
                ["node.description"] = "HDMI",
              },
            }
          ''
        )
      ];
    };
  };
}
