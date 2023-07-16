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
set number
let &termencoding=&encoding
set termguicolors
set fileencodings=utf-8,gbk,ucs-bom,cp936
set termguicolors
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
Plug 'chriskempson/base16-vim'
Plug 'github/copilot.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'sheerun/vim-polyglot'
call plug#end()

let g:copilot_filetypes = { '*': v:false, 'python': v:true }
let g:python_highlight_all = 1
