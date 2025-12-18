{ config, lib, pkgs, ... }:

{
  boot = {
    swraid = {
      enable = true;
      mdadmConf = ''
        DEVICE partitions
        ARRAY /dev/md0 metadata=1.2 UUID=18a04df1:78ae64c4:5a73eb0e:10bcc24f
        ARRAY /dev/md1 metadata=1.2 UUID=52aafe06:3c979a79:c8854d90:64373358
        MAILADDR paschoal@local
      '';
    };
  };
}
