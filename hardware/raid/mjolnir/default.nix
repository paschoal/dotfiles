{ config, lib, pkgs, ... }:

let
  raid0 = ''
    DEVICE partitions
    ARRAY /dev/md0 metadata=1.2 UUID=3ba15b3e:d6b89a75:a89a4536:a81278c8
    MAILADDR paschoal@local
  '';
in {
  boot = {
    swraid = {
      enable = true;
      mdadmConf = raid0;
    };
  };
}
