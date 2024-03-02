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

      bin = lib.mkOption {
        default = ".";
        type = lib.types.path;
        description = ''
          Path to store script file.
        '';
      };
    };
  };

  config = {
    home.packages = with pkgs; [
      grim
      slurp
    ];

    home.file = {
      "screenshot" = {
        target = "${config.screenshots.bin}/screenshot";
        enable = true;
        source = let
          script = pkgs.writeShellScriptBin "screenshot" ''
            ${pkgs.slurp}/bin/slurp | \
              ${pkgs.grim}/bin/grim -g - \
              ${config.screenshots.folder}/screenshot-$(date +%Y%m%d%H%M%S).png
          '';

          in "${script}/bin/screenshot";
      };
    };
  };
}
