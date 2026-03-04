{ pkgs, ... }:
{
  users.users.paschoal.extraGroups = [ "dialout" ];

  #
  # setting manually to 70- because it does need to be
  # set before 73-seat-late.rules
  #
  services.udev.packages= [
    (
      pkgs.writeTextDir "lib/udev/rules.d/70-stm32-dfu.rules" ''
        SUBSYSTEM=="usb",ATTRS{idVendor}=="0483",ATTRS{idProduct}=="df11",TAG+="uaccess"
      ''
    )
  ];
}
