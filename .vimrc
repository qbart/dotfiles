let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_browse_split=4

call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

set number
set showmatch               " match brackets
set ignorecase              " matching mode
set hlsearch                " highlight search results
syntax on


" Set <space> as the leader key (update if needed)
let mapleader = ","
let maplocalleader = " "

set clipboard=unnamed
set nocompatible " Forget about vi compatibility
" set nonumber " No line numbers on init
set encoding=utf-8
set fileencoding=utf-8
language en_US.utf-8
set sidescroll=1
set sidescrolloff=1
set scrolloff=9
set ttyfast
set cursorline
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set history=10000
set undolevels=2000
set wildignore+=*.o,*.obj,*.bak,*.exe,*.pyc,*.class,**/node_modules/**
set nowrap
set textwidth=0
set wrapmargin=0
set splitright
set splitbelow
set noswapfile
"set visualbell
set smartindent
set smartcase
set hidden
set nobackup
set nowritebackup
set cmdheight=1
" set autoindent
set shortmess=Ot
set termguicolors


augroup CustomizeDracula
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
augroup END

" theme
set background=dark
let g:dracula_colorterm = 0
colorscheme dracula


" KEYMAPS-------------------------------------------------------------------------------------------------------------------

" Disable Space
nnoremap <silent> <Space> <Nop>
vnoremap <silent> <Space> <Nop>

" Disable Q in normal mode
nnoremap <silent> Q <Nop>

" Clear highlights with Enter
nnoremap <silent> <CR> :noh<CR>

" Remap navigation keys for i3-like layout
nnoremap ; l
vnoremap ; l
nnoremap l k
vnoremap l k
nnoremap k j
vnoremap k j
nnoremap j h
vnoremap j h

" Faster navigation with control
nnoremap <C-k> 5j
vnoremap <C-k> 5j
nnoremap <C-l> 5k
vnoremap <C-l> 5k

" Window splits
nnoremap <leader>wk :sp<CR>
nnoremap <leader>wl :vs<CR>

" Resize panes
nnoremap <C-M-k> :resize -3<CR>
nnoremap <C-M-l> :resize +3<CR>
nnoremap <C-M-j> :vertical resize -3<CR>
nnoremap VIMKBRESR :vertical resize +3<CR>        " See comment: custom mapped outside Vim, e.g., in terminal config

" Reload vimrc/config
nnoremap <leader>wr :source $MYVIMRC \| :e!<CR>

" Buffer management
" nnoremap <Tab> :bn<CR>
" nnoremap <S-Tab> :bp<CR>
nnoremap <leader>d :bd!<CR>

" Line swapping (move lines up/down)
nnoremap <S-k> :m+<CR>==
nnoremap <S-l> :m-2<CR>==

vnoremap <S-k> :m'>+<CR>gv=gv
vnoremap <S-l> :m-2<CR>gv=gv

inoremap <C-S-k> <Esc>:m+<CR>==gi
inoremap <C-S-l> <Esc>:m-2<CR>==gi

" ------------------------------------------------------------------------------------------------------

" END OF CONFIG
