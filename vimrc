" Pathogen Plugin
  execute pathogen#infect()

" Colors
  colorscheme Monokai
  set background=dark
  let g:airline_theme = "powerlineish"
  let g:molokai_original = 1
  let g:rehash256 = 1
  syntax enable

" Space and Tabs
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set nowrap
  set list listchars=eol:¬,trail:-,extends:>,precedes:<
  set cursorline

" UI
  filetype indent on

  set ruler
  set showcmd
  set wildmenu
  set number
  set lazyredraw
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

" Other Shortcuts
  let mapleader=","
  inoremap jk <esc>

" NerdTree
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1

" Airline
  set laststatus=2
  let g:airline_powerline_fonts = 1

" Color Column
  let &colorcolumn=join(range(81,999),",")
  highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Open NerdTree
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
