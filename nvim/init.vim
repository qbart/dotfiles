let g:polyglot_disabled = ['cpp', 'go']
let g:highlightedyank_highlight_duration = 120

call plug#begin()

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'sebdah/vim-delve'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'dominikduda/vim_current_word'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'derekwyatt/vim-fswitch'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-multiple-cursors'
Plug 'juliosueiras/terraform-lsp'
Plug 'qbart/vim-aurora'
Plug 'qbart/vim-cpp-modern'
Plug 'airblade/vim-rooter'
Plug 'rhysd/clever-f.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'francoiscabrol/ranger.vim'  
Plug 'rbgrouleff/bclose.vim' " ranger dep for nvim
Plug 'machakann/vim-highlightedyank' " highlight yank
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': [
      \ 'javascript',
      \ 'typescript',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'json',
      \ 'graphql',
      \ 'vue',
      \ 'lua',
      \ 'python' ] }

Plug 'isobit/vim-caddyfile'

call plug#end()

source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/go.vim
source $HOME/.config/nvim/cpp.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/startup.vim
source $HOME/.config/nvim/caddy.vim
source $HOME/.config/nvim/hashistack.vim
source $HOME/.config/nvim/i3.vim
source $HOME/.config/nvim/ruby.vim
source $HOME/.config/nvim/theme.vim

" vim-prettier
augroup plugin_prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml Prettier
augroup END

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

"zen
let g:goyo_width="80%"
"

" disable ranger default mapping
let g:ranger_map_keys = 0

"""rooter
let g:rooter_patterns = [ 'main.cc', 'main.go', '.git/', '.git', 'LICENSE' ]
"

" ranger
let g:ranger_command_override = 'ranger --cmd "set column_ratios=1,1"'

"""panes
map <M-j> <C-W>h 
map <M-k> <C-W>j
map <M-l> <C-W>k
map <M-;> <C-W>l
map <M-Left> <C-W>h 
map <M-Down> <C-W>j
map <M-Up> <C-W>k
map <M-Right> <C-W>l
"""line
nmap n :set number!<CR>
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

" resize panes
nnoremap <C-M-k>    :resize -2<CR>
nnoremap <C-M-l>    :resize +2<CR>
nnoremap <C-M-j>    :vertical resize -2<CR>
"        <C-M-;> (alacritty)
nnoremap VIMKBRESR  :vertical resize +2<CR>

" buffers
" nnoremap <TAB> :FZFMru<CR>
" nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
nmap <leader>d :bd!<cr>

" moving lines
nnoremap <S-k> :m+<CR>==
nnoremap <S-l> :m-2<CR>==
inoremap <C-S-k> <Esc>:m+<CR>==gi
inoremap <C-S-l> <Esc>:m-2<CR>==gi
vnoremap <S-k> :m'>+<CR>gv=gv
vnoremap <S-l> :m-2<CR>gv=gv

noremap <C-k> 5j
noremap <C-l> 5k

nmap <C-e> :Ranger<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-w><C-k> :sp<CR>
nmap <C-w><C-l> :vs<CR>

nmap <C-f> :BLines<CR>
nmap <C-t> :Tags<CR>
nmap <C-j> :Files<CR>
nmap <C-b> :Marks<CR>
nmap <C-g> :Rg<CR>

map <C-w>z :Goyo<CR>
nmap <C-w>r :so $MYVIMRC<CR>
nmap <C-m> :messages<CR>
"

" snippets
let g:coc_snippet_next = '<tab>'
" let g:coc_snippet_prev = '<s-tab>'

" https://github.com/editorconfig/editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
au FileType gitcommit let b:EditorConfig_disable = 1
