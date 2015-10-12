" Pathogen Plugin
  execute pathogen#infect()

" Colors
  colorscheme Monokai
  syntax enable

" Space and Tabs
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set nowrap

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
  nnoremap <leader>a  :Ag
  nnoremap <leader>ev :vsp ~/.nvimrc<CR>
  nnoremap <leader>ez :vsp ~/.zshrc<CR>
  nnoremap <leader>sv :source ~/.nvimrc<CR>

" CtrlP
  let g:ctrlp_match_window = "bottom,order:ttb"
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_working_path_mode = 0
  "let g:ctrlp_user_command = 'ag -l --no-color --hidden -g ""'

" Airline
  let g:airline_powerline_fonts = 1
  let g:airline_theme = "powerlineish"
  let g:airline_section_z = ""
  let g:airline_left_sep = ""
  let g:airline_right_sep = ""

" NerdTree
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 0

" Color column if > 81
  let &colorcolumn=join(range(81,999),",")
  highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Clipboard
  set clipboard=unnamedplus
