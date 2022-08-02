call plug#begin()
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-commentary'
call plug#end()

"""various
syntax enable
filetype plugin on
set nocompatible "forget about vi compatibility

language en_US.UTF-8
set langmenu=en_US.UTF-8
set encoding=utf-8
set fileencoding=utf-8

set sidescroll=1
set sidescrolloff=1
set scrolloff=9
set ttyfast

set nonumber " no line nums on init
syntax on
set cursorline " highlight current line
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set history=10000
set undolevels=2000
set wildignore=+*.o,*.obj,*.bak,*.exe,*.pyc,*.class,**/node_modules/**
set nowrap
set textwidth=0 " no wordwrap
set wrapmargin=0
set splitright
set splitbelow
" set lazyredraw
set noswapfile
set novisualbell
set smartindent
set smartcase

set clipboard=unnamedplus

set hidden "https://medium.com/usevim/vim-101-set-hidden-f78800142855
set nobackup
set nowritebackup
set cmdheight=1
" set autoindent
set updatetime=400
set shortmess=ac "http://vimdoc.sourceforge.net/htmldoc/options.html#'shortmess'

"""comments
nmap // <Plug>CommentaryLine
xmap /  <Plug>Commentary
nmap /  <Plug>Commentary
omap /  <Plug>Commentary

"""keybindings
let mapleader = ","
let maplocalleader = "\<Space>"

nmap K <nop>
nmap Q <Nop> "disable ex mode

" natural order consistent with i3
noremap ; l
noremap l k
noremap k j
noremap j h

" moving lines
noremap <S-k> :m+<CR>==
noremap <S-l> :m-2<CR>==
inoremap <C-S-k> <Esc>:m+<CR>==gi
inoremap <C-S-l> <Esc>:m-2<CR>==gi
vnoremap <S-k> :m'>+<CR>gv=gv
vnoremap <S-l> :m-2<CR>gv=gv

noremap <C-k> 5j
noremap <C-l> 5k

nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-k><C-k> :sp<CR>
nmap <C-k><C-l> :vs<CR>

nmap <CR> :noh<CR>
"
