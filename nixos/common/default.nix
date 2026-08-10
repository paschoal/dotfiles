{ config, pkgs, lib, ... }:

{
  options = {
    common.localization = lib.mkOption {
      default = "America/Montreal";
      type = lib.types.str;
      description = ''
        Timezone to be set.
      '';
    };
  };

  imports = [ ./fonts ];

  config = {
    environment.systemPackages = with pkgs; [
      gnupg
      pinentry-gtk2
    ];

    services.pcscd.enable = true;

    programs = {
      fish.enable = true;
      zsh.enable = true;
      gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-gtk2;
      };
      git = {
        enable = true;
        lfs.enable = true;
      };
    };

    nix = {
      settings.auto-optimise-store = true;
      gc = {
        automatic = true;
        dates = "weekly";
      };
    };

    time.timeZone = config.common.localization;
    i18n.defaultLocale = "en_CA.UTF-8";
  };
}
