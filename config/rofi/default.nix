{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
    rofi-pass
  ];

  home.file = {
    "dmenu-launcher" = {
      target = "${config.home.homeDirectory}/bin/dmenu-launcher";
      enable = true;
      source = let
        script = pkgs.writeShellScriptBin "launcher" ''
          ${pkgs.rofi}/bin/rofi -show run
        '';
        in "${script}/bin/launcher";
    };
  };

  xdg.configFile = {
    rofi = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/rofi/config";
      recursive = true;
    };

    "rofi-pass/config".text = ''
      BROWSER='xdg-open'
      default_do='typePass'

      clip='primary'
      clip_clear=30
      clipboard_backend=xclip
    '';
  };
}
