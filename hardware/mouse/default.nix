{ config, lib, pkgs, ... }:

{
  #
  # btn_extra -> left shift
  #
  services.udev = {
    enable = true;
    extraHwdb = ''
      evdev:input:b0003v1532p00B8*
        KEYBOARD_KEY_90004=leftshift
    '';
  };

  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
  };
}
