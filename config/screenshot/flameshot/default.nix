{ config, lib, pkgs, ... }:
{
  options = {
    screenshots = {
      folder = lib.mkOption {
        default = ".";
        type = lib.types.path;
        description = ''
          Path to store screenshots.
        '';
      };
    };
  };

  config = {
    services.flameshot = {
      enable = true;
      settings.General = {
        contrastOpacity = 188;
        saveAsFileExtension = "png";
        savePath = config.screenshots.folder;
        savePathFixed = true;
        showDesktopNotification = false;
        showHelp = false;
        showSidePanelButton = false;
        showStartupLaunchMessage = false;
      };
    };
  };
}
