{ config, pkgs, ... }:

{
  imports = [
    ./plugins/onedark-nvim
    ./plugins/lualine-nvim
    ./plugins/indent-blankline-nvim
    ./plugins/neo-tree-nvim
    ./plugins/telescope-nvim
    ./plugins/nvim-treesitter
    ./plugins/vim-endwise
    ./plugins/vim-matchup
    ./plugins/nvim-cmp
    ./plugins/nvim-notify
    ./plugins/pomo-nvim
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      fd
      ripgrep
    ];

    vimAlias = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    withNodeJs = false;

    extraConfig = ''
      let mapleader=","

      set updatetime=250
      set nohlsearch
      set incsearch 
      set number
      set noruler
      set nowrap
      set nocursorline
      set eol
      set nowrapscan
      set noerrorbells
      set novisualbell

      set clipboard=unnamedplus

      set list
      set listchars+=tab:··,eol:¬,trail:-,extends:>,precedes:<

      set expandtab
      set autoindent
      set smartindent
      set nocindent
      set shiftwidth=2
      set softtabstop=2

      set foldmethod=indent
      set foldlevel=20

      set termguicolors
      set conceallevel=2

      au FileType ruby setlocal indentkeys-=.

      augroup filetypedetect
        au! BufRead,BufNewFile dockerfile.yml setfiletype dockerfile
        au! BufRead,BufNewFile dockerfile.yaml setfiletype dockerfile
      augroup END

      nmap <space> za
      nmap <leader>ff <Cmd>Telescope find_files<CR>
      nmap <leader>fb <Cmd>Telescope buffers<CR>
      nmap <leader>ot <Cmd>ObsidianToday<CR>
      nmap <leader>oy <Cmd>ObsidianYesterday<CR>
      nmap <leader>ow <Cmd>ObsidianTomorrow<CR>
    '';
  };
}
