{ pkgs, lib, config, ... }:
{
  options = {
    wallpaper = {
      image = lib.mkOption {
        default = false;
        type = lib.types.str;
        description = ''
          Path of image file
        '';
      };
    };
  };

  config = {
    home.packages = [ pkgs.swaybg ];
    systemd.user.services.swaybg = {
      Unit = {
        Description = "Wallpaper tool for Wayland Compositors";
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
        Requisite = "graphical-session.target";
      };
      Install = {
        WantedBy = [ "niri.service" ];
      };
      Service = {
        ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${config.wallpaper.image}";
        Restart = "on-failure";
      };
    };
  };
}
