set mouse=
set sw=4
set tabstop=4
set expandtab
set showcmd
set smartindent
set autoindent
set incsearch
set nobackup
syntax on
set nobackup
set noswapfile
"use the shared clipboard across system
if $TMUX == ''
    set clipboard+=unnamed
endif
"colorscheme elflord
set number
colorscheme desert
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Shotcuts
""""""""""""""""""""""""""""""
let mapleader = '\'
nmap <C-W>t :tabnew<CR>
nmap <C-M> :tabnext<CR>
nmap <C-N> :tabprevious<CR>
filetype plugin indent on
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
nmap <C-W>p iimport pdb; pdb.set_trace()<CR><ESC>

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'chriskempson/base16-vim'
call plug#end()
