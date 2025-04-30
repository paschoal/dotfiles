{ config, pkgs, ... }:

{
  imports = [
    ./plugins/onedark-nvim
    ./plugins/neo-tree-nvim
    ./plugins/lualine-nvim
    ./plugins/telescope-nvim
    ./plugins/nvim-treesitter
    ./plugins/indent-blankline-nvim

    #./plugins/vim-endwise
    #./plugins/nvim-notify
    #./plugins/pomo-nvim
    #./plugins/lsp-config
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

      set updatetime=750
      set nohlsearch
      set incsearch 
      set number
      set relativenumber
      set noruler
      set nowrap
      set nocursorline
      set eol
      set nowrapscan
      set noerrorbells
      set novisualbell
      set signcolumn=yes

      set clipboard=unnamedplus

      set list
      set listchars+=tab:··,eol:¬,trail:-,extends:>,precedes:<
      set backspace=indent,eol,start

      set expandtab
      set autoindent
      set shiftwidth=2
      set softtabstop=2

      set termguicolors
      set conceallevel=2

      set undodir="~/.vim/undo"
      set undofile

      au FileType ruby setlocal indentkeys-=.

      augroup filetypedetect
        au! BufRead,BufNewFile dockerfile.yml setfiletype dockerfile
        au! BufRead,BufNewFile dockerfile.yaml setfiletype dockerfile
      augroup END

      nmap <space> za
      nmap <leader>ff <Cmd>Telescope find_files<CR>
      nmap <leader>fb <Cmd>Telescope buffers<CR>
    '';
  };
}
