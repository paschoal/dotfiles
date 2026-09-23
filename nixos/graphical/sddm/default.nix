{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    theme = "where_is_my_sddm_theme";
    wayland.enable = true;

    extraPackages = with pkgs; [
      kdePackages.qt5compat
    ];
  };

  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];
}
