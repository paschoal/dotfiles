{ ... }:

{
  services.xserver = {
    enable = true;

    windowManager = {
      windowmaker = {
        enable = true;
      };
    };
  };
}
