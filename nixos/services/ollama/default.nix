{ lib, pkgs, config, ... }:

{
  options = {
    ollama-config = {
      with-open-webui = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Enable open-webui
        '';
      };
    };
  };

  config = {
    services = lib.mkMerge [
      {
        ollama = {
          enable = true;
          package = pkgs.ollama-rocm;
        };
      }

      (
        lib.mkIf config.ollama-config.with-open-webui {
          open-webui.enable = true;
        }
      )
    ];

    environment.systemPackages = lib.mkMerge [
      []
    ];

    systemd.services = lib.mkMerge [
      #
      # don't run on boot.
      #
      { ollama.wantedBy = lib.mkForce []; }
      (
        lib.mkIf config.ollama-config.with-open-webui {
          open-webui.wantedBy = lib.mkForce [];
        }
      )
    ];
  };
}
