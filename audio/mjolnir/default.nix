{ config, lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;

    wireplumber = {
      enable = true;
      configPackages = [];

      #
      # example of lua configuration file to wireplumber
      #
      # configPackages = [
      #   (
      #     pkgs.writeTextDir "share/wireplumber/main.lua.d/50-configure-hdmi.lua" ''
      #       alsa_monitor.rules = {
      #         {
      #           matches = {{{ "node.name", "equal", "alsa_output.pci-0000_2d_00.1.playback.10.0" }}}.
      #           apply_properties = {
      #             ["api.alsa.use-acp"] = true,
      #             ["audio.channels"] = "2",
      #             ["node.nick"] = "HDMI Main",
      #           },
      #         },
      #       }
      #     ''
      #   )
      # ];
    };
  };

  users.users.paschoal = {
    extraGroups = ["audio"];
  };
}
