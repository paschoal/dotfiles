"Pathogen load
execute pathogen#infect()

"Filetypes
filetype plugin on
filetype indent on

"Indent
set expandtab
set shiftwidth=2
set softtabstop=2

"Misc
syntax enable
set ruler
set cmdheight=2
set nowrap
set backspace=2
set number
set nocompatible
set enc=utf-8
set foldcolumn=1
set linespace=0
set history=1000
set list listchars=eol:¬,trail:-,extends:>,precedes:<
set ffs=unix

"SyntaxComplete
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif

"Theme
colorscheme molokai
set t_Co=256

"Airline
"Installed through Arch AUR
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

"NerdTree
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

"Color column if > 81
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

"Gvim Configuration
set guioptions-=m "Menu Bar
set guioptions-=T "Toolbar
set guioptions-=r "Right Scrollbar
set guioptions-=L "Left Scrollbar

"Font
set guifont=Terminus\ 12
"set guifont=Ubuntu\ Mono\ 12

"Clipboard
set clipboard=unnamedplus

"CtrlP Speed up
let g:ctrlp_use_caching=0
"if executable('ag')
"  set grepprg=ag\ --nogroup\ --nocolor
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"else
"  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"  let g:ctrlp_prompt_mappings = {
"  | 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
"  \ }
"endif

"Space as map leader
let mapleader = "\<Space>"
