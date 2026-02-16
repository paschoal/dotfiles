{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where_is_my_sddm_theme";
    extraPackages = [
      pkgs.kdePackages.qt5compat
    ];
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    where-is-my-sddm-theme
  ];
}
