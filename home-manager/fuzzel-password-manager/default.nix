{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #
    # official cli is extremely slow.
    #
    # bitwarden-cli
    rbw
    jq
  ];

  home.file = {
    ".local/bin/password-manager" = {
      executable = true;
      text = ''
        #!/run/current-system/sw/bin/sh
        item=$(rbw ls | fuzzel -d)
        ydotool type $(rbw get $item)
      '';
    };
  };

  xdg.desktopEntries = {
    password-manager = {
      name = "Password Manager";
      genericName = "Password Manager";
      exec = "/data/home/.local/bin/password-manager";
      terminal = false;
      categories = [ "Utility" ];
    };
  };
}
