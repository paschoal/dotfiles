{ lib, pkgs, config, options, ... }:

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

      with-goose-cli = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Enable goose-cli
        '';
      };
    };
  };

  config = {
    services = lib.mkMerge [
      {
        ollama = {
          enable = true;
          acceleration = "rocm";
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
      (
        lib.mkIf config.ollama-config.with-goose-cli [
          pkgs.goose-cli
        ]
      )
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
