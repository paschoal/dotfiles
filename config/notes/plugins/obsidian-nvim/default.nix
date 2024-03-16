{ config, pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = obsidian-nvim;
        type = "lua";
        config = ''
          require("obsidian").setup {
            workspaces = {
              {
                name = "personal",
                path = "~/notes/personal",
              },
              {
                name = "hyre",
                path = "~/notes/hyre",
              },
            },

            daily_notes = {
              date_format = "%Y-%m-%d",
              folder = "dailies",
            }
          }
        '';
      }
    ];
  };
}
