{ config, lib, ... }:
{
  options = {
    beszel-config = {
      environmentFile = lib.mkOption {
        type = lib.types.path;
        description = ''
          Environment file to be used as configuration
        '';
      };

      extraFileSystems = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = ''
          Extra filesystems to mount
        '';
      };

      skipGPU = lib.mkOption {
        default = "false";
        type = lib.types.str;
        description = ''
          Disable GPU monitoring
        '';
      };

      skipSystemd = lib.mkOption {
        default = "false";
        type = lib.types.str;
        description = ''
          Disable Systemd monitoring
        '';
      };
    };
  };

  config = {
    services.beszel.agent = {
      enable = true;
      environment = lib.mkMerge [
        {
          LISTEN = "45876";
          HUB_URL = "https://tlm.paschoal.me";
          SKIP_GPU = config.beszel-config.skipGPU;
          SKIP_SYSTEMD = config.beszel-config.skipSystemd;
        }

        (
          lib.mkIf (config.beszel-config.extraFileSystems != "") {
            EXTRA_FILESYSTEMS = config.beszel-config.extraFileSystems;
          }
        )
      ];
      environmentFile = config.beszel-config.environmentFile;
      openFirewall = true;
    };
  };
}
