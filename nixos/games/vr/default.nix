{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sidequest
    wlx-overlay-s
  ];

  services.wivrn = {
    enable = true;
    openFirewall = true;
    defaultRuntime = true;
    autoStart = true;
    config = {
      enable = true;
      json = {
        scale = 1.0;
        bitrate = 100000000;
        encoders = [
          {
            encoder = "vaapi";
            codec = "h265";
            width = 1.0;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
          }
        ];
      };
    };
  };

  users.users.paschoal.extraGroups = [ "plugdev" ];

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
