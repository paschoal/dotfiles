set nocompatible

" Install Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf'
call plug#end()

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
filetype indent on
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

" IndentGuide
nnoremap <leader>ig :IndentGuidesToggle<CR>
set ts=2 sw=2 et
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=239

" Ruby Slowdown
" autocmd Filetype ruby setlocal nocursorline

" Shell
set shell=zsh

" Misc Config
set backspace=indent,eol,start
set eol
set nowrapscan
set noerrorbells
set novisualbell

" FZF action
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~ 20%' }

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
