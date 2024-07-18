let
  paschoal = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCVbiPvgsIfs8zztc+KdW961/1yYOIXbbYBcy1FF0lxqqDoAs9ulENFsb3jCSux83PSLpaTImrNAYnhNB2ZGfu7Ct2rIC3NNZRFzIDp5CCisPGhR+8W8XGBxkreZ0t26tr33hwHihvN8Dz1kZ+SDI4NDz1efiDuUv5rIBSo6rVNOIqrHbgk45AJBogzSMTnnL63a00i4beSv4IIISiKx+ZZlg5TKK9BR+hLV2ZtTH2+rS1zeaMNk1g3Pa/Mr4+5tM02bD8+p2f3tBaJ1B/h8MWe/Whn9zEDgMmfDVFdoz/7tDWZVBY46bAewnbnouNYa2ZgQR/k/kwLg5M2b4WA4A59 paschoal@asteros";
in {
  "wifi-uaireless-2-4g.age".publicKeys = [paschoal];
  "wifi-uaireless.age".publicKeys = [paschoal];
}
