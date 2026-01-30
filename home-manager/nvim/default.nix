{ pkgs, ... }:

{
  imports = [
    ./plugins/onedark-nvim
    ./plugins/neo-tree-nvim
    ./plugins/lualine-nvim
    ./plugins/telescope-nvim
    ./plugins/nvim-treesitter
    ./plugins/indent-blankline-nvim
    ./plugins/vim-dadbod
    ./plugins/nvim-notify
    ./plugins/lsp-config
    ./plugins/vim-tmux-navigator
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      fd
      ripgrep
      go
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
      execute "set colorcolumn=" . join(range(80,100), ',')
      set backspace=indent,eol,start

      set expandtab
      set autoindent
      set shiftwidth=2
      set softtabstop=2

      set termguicolors
      set conceallevel=2

      set undodir="~/.vim/undo"
      set undofile

      autocmd Filetype markdown setlocal wrap textwidth=100
    '';
  };
}
