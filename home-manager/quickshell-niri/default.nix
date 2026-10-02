{ ... }:

let
  source = builtins.getFlake "github:imiric/qml-niri/main";
  system = builtins.currentSystem;
  qml-niri = source.packages.${system}.default;
  qck-shll = source.packages.${system}.quickshell;
in {
  home = {
    #
    # setting as env vars affect qutebrowser
    # that is not apparently able to handle
    # the rendering engine as vulkan.
    #
    # sessionVariables.QSG_RHI_BACKEND = "vulkan";
    #
    packages = [ qml-niri ];
  };

  programs.quickshell = {
    enable = true;
    package = qck-shll;
  };
}
