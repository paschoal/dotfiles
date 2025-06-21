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

  config.xdg.configFile = {
    "flameshot/flameshot.ini".text = ''
      [General]
        savePath=${config.screenshots.folder}
        savePathFixed=true
        saveAsFileExtension=.png
        showHelp=false
        showSidePanelButton=false
        showDesktopNotification=true
        filenamePattern=%Y-%m-%d-%H-%M-%S
        disabledTrayIcon=true
        disabledGrimWarning=true
        autoCloseIdleDaemon=true
        allowMultipleGuiInstances=false
        drawThickness=1
        keepOpenAppLauncher=false
        startupLaunch=false
        contrastOpacity=190
        saveAfterCopy=true
        antialiasingPinZoom=true
        useJpgForClipboard=false
        uploadWithoutConfirmation=false
        jpegQuality=100
    '';
  };
}
