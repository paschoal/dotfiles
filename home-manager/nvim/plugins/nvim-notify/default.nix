{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-notify;
        type = "lua";
        config = ''
          require("notify").setup {
            background_colour = "#000000"
          }
        '';
      }
    ];
  };
}
