set nocompatible

" Pathogen
execute pathogen#infect()

" Remap Leader
let mapleader=","

" Colors
set background=dark
colorscheme Monokai
syntax enable
hi Normal ctermbg=none
highlight NonText ctermbg=none

" Airline
set laststatus=2
let g:airline_powerline_fonts=1

" Space and Tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap
set list listchars=eol:¬,trail:-,extends:>,precedes:<
set cursorline

" UI
" filetype indent on
filetype plugin indent on
set ruler
set showcmd
set wildmenu
set number
set lazyredraw
set regexpengine=1
set showmatch

" Search
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" Moving
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

" NerdTree
nnoremap <leader>1 :NERDTree .<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Tagbar
nnoremap <leader>0 :TagbarToggle<CR>

" Codi
let g:codi#width=50

" IndentGuide
nnoremap <leader>ig :IndentGuidesToggle<CR>
set ts=2 sw=2 et
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Ruby Slowdown
autocmd Filetype ruby setlocal nocursorline

" Shell
set shell=zsh

" Misc Config
set backspace=indent,eol,start
set eol
set nowrapscan
set noerrorbells
set novisualbell
