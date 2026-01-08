{ pkgs, ... }:

{
  home.packages = with pkgs; [ mangohud ];

  xdg.configFile = {
    "MangoHud/MangoHud.conf" = {
      text = ''
        gpu_load_change
        gpu_power
        gpu_temp

        cpu_load_change
        cpu_power
        cpu_temp

        fps
      '';
    };
  };
}
