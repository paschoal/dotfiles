{ config, ... }:
{
  services.mpd = {
    enable = true;
    user = "paschoal";
    settings = {
      music_directory = "/data/home/music";
      audio_output = [
        {
          type = "pipewire";
          name = "pipewire output";
          enabled = "no";
        }

        {
          type = "pulse";
          name = "pulse audio";
          enabled = "yes";
        }
      ];
    };
  };

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
