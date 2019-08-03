call plug#begin('~/.local/share/nvim/plugged')
Plug 'terryma/vim-multiple-cursors'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'yggdroot/indentline'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

set number
set showmatch               " match brackets
set ignorecase              " matching mode
set hlsearch                " highlight search results
set tabstop=4
set softtabstop=4
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set encoding=UTF-8

syntax on
color dracula

map <C-b> :NERDTreeToggle<CR>
map <C-s> :w<CR>
map <C-q> :q<CR>

let g:strip_whitespace_on_save = 1
