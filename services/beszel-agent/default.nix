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
    };
  };

  config = {
    services.beszel.agent = {
      enable = true;
      environment = {
        LISTEN = "45876";
        HUB_URL = "https://tlm.paschoal.me";
      };
      environmentFile = config.beszel-config.environmentFile;
      openFirewall = true;
    };
  };
}
