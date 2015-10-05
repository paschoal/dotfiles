"Pathogen load
execute pathogen#infect()

"Indent
set expandtab
set shiftwidth=2
set softtabstop=2

"Misc
syntax enable
set background=dark
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

set guioptions-=m " No menu bar
set guioptions-=T " No tool bar
set guioptions-=r " No right-hand scroll bar
set guioptions-=L " No left-hand scroll bar

"Theme
colorscheme molokai

"Airline
"Installed through Arch AUR
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_left_sep=" "
let g:airline_right_sep="▟"
let g:airline_theme="powerlineish"
let g:airline_section_z=""

"NerdTree
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0

" Color column if > 81
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

"Font
set guifont=Roboto\ Mono\ 10

"Clipboard
set clipboard=unnamedplus
