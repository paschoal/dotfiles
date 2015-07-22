"Pathogen load
execute pathogen#infect()

"Filetypes
" filetype plugin on
" filetype indent on

"Indent
set expandtab
set shiftwidth=2
set softtabstop=2

"Misc
syntax enable
set ruler
set nowrap
set backspace=2
set number
set nocompatible
set encoding=utf-8
set linespace=0
set history=1000
set list listchars=eol:¬,trail:-,extends:>,precedes:<
set ffs=unix

"Theme
colorscheme molokai
set t_Co=256

"Airline
"Installed through Arch AUR
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_left_sep="▙"
let g:airline_right_sep="▟"
let g:airline_theme="powerlineish"
let g:airline_section_z=''

"NerdTree
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

"Color column if > 81
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

"Gvim Configuration
" set guioptions-=m "Menu Bar
" set guioptions-=T "Toolbar
" set guioptions-=r "Right Scrollbar
" set guioptions-=L "Left Scrollbar

"Font
set guifont=Ubuntu\ Mono\ 15

"Clipboard
" set clipboard=unnamedplus

"Space as map leader
" let mapleader = "\<Space>"
