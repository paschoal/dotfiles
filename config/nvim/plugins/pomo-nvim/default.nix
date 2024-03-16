{ config, pkgs, lib, ... }:

with import <nixpkgs> {};
let
  pomo-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "pomo.nvim";
    version = "v0.4.5";
    src = fetchFromGitHub rec {
      owner = "epwalsh";
      repo = "pomo.nvim";
      rev = version;
      sha256 = "sha256-QElI5XugNS25pbtG1aDYXXc0dkTBJ+ifwVLFuFLAAXs=";
    };
  };
in {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = pomo-nvim;
        type = "lua";
        config = ''
          require("pomo").setup {
            update_interval = 1000,
            notifiers = {
              {
                name = "Default",
                opts = {
                  sticky = false,
                },
              },
            },
          }

          require("lualine").setup {
            sections = {
              lualine_x = {
                function()
                  local ok, pomo = pcall(require, "pomo")
                  if not ok then
                    return ""
                  end

                  local timer = pomo.get_first_to_finish()
                  if timer == nil then
                    return ""
                  end

                  return "-> " .. tostring(timer)
                end,
                "encoding",
                "fileformat",
                "filetype",
              },
            },
          }
        '';
      }
    ];
  };
}
