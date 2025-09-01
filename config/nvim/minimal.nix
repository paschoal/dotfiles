{ config, pkgs, ... }:

{
  imports = [
    ./plugins/onedark-nvim
    ./plugins/lualine-nvim
  ];

  programs.neovim = {
    enable = true;
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
    '';
  };
}
