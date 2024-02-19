{ config, pkgs, ... }:

{

  home.file = {
    ".wallpaper/ow.landscape.jpg" = {
      source = config.lib.file.mkOutOfStoreSymlink ./files/ow.landscape.jpg;
    };

    ".wallpaper/ow.portrait.jpg" = {
      source = config.lib.file.mkOutOfStoreSymlink ./files/ow.portrait.jpg;
    };
  };
}
