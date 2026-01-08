{ pkgs, ... }:

{
  home.packages = with pkgs; [ feh ];
  xdg.desktopEntries = {
    feh = {
      name = "feh";
      genericName = "Image Viewer";
      exec = "feh";
      terminal = false;
      categories = [ "Graphics" "Utility" ];
      mimeType = [
        "image/gif"
        "image/vnd.ms-photo"
        "image/jpe"
        "image/jpg"
        "image/jpeg"
        "image/png"
        "image/svg+xml"
        "image/tiff"
        "image/tif"
        "image/bmp"
      ];
    };
  };
}
