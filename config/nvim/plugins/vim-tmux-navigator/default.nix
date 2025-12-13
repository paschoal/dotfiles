{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = vim-tmux-navigator;
        config = ''
          let g:tmux_navigator_no_mappings = 1
          nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
          nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
          nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
          nnoremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
        '';
      }
    ];
  };
}
