set mouse=
set sw=2
set tabstop=2
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
set number
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
syntax enable
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

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'Exafunction/codeium.vim'
Plug 'sheerun/vim-polyglot'
Plug 'EdenEast/nightfox.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
call plug#end()

set termguicolors
colorscheme nightfox
