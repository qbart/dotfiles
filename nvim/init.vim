let g:polyglot_disabled = ['cpp', 'go']
let g:highlightedyank_highlight_duration = 200

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
" Plug 'luochen1990/rainbow'
" Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
" Plug 'sbdchd/neoformat'
Plug 'qbart/vim-aurora'
Plug 'qbart/vim-cpp-modern'
Plug 'airblade/vim-rooter'
Plug 'rhysd/clever-f.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'francoiscabrol/ranger.vim'  
Plug 'rbgrouleff/bclose.vim' " ranger dep for nvim
Plug 'machakann/vim-highlightedyank' " highlight yank

call plug#end()

"TODO
" https://github.com/dense-analysis/ale
"Plug 'SirVer/ultisnips'
"tabularize
"ctags -R .
"snippets
"nnoremap ,html :-1read $HOME/.config/nvim/tpl/cpp_class.cc<CR>3jwf>a
"tf lsp
"Plug 'editorconfig/editorconfig-vim'

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

set nonumber " show line nums
syntax on
set cursorline " highlight current line
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set history=10000
set undolevels=2000
set wildignore=+*.o,*.obj,*.bak,*.exe,*.pyc,*.class,**/node_modules/**
nmap Q <Nop> "disable ex mode
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

"only relative MRU
let g:fzf_mru_relative = 1

"zen
let g:goyo_width=110
"

" disable ranger default mapping
let g:ranger_map_keys = 0

"""rooter
let g:rooter_patterns = [ 'main.cc', 'main.go', '.git/', '.git', 'LICENSE' ]
"

"""theme
let g:cpp_class_scope_highlight = 1
let g:cpp_named_requirements_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_functions=1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_function_parameters=0
let g:go_auto_sameids = 0
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

set signcolumn=yes
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_delay = 200 "ms
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 0
colorscheme aurora

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
nnoremap <TAB> :FZFMru<CR>
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

" nmap <C-e> :NERDTreeFind<CR>
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

"neoformat
let g:neoformat_verbose = 0


"""hashistack 
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1
au BufWritePre {*.hcl,*.nomad} call terraform#fmt()

set hidden "https://medium.com/usevim/vim-101-set-hidden-f78800142855
set nobackup
set nowritebackup
set cmdheight=1
" set autoindent
set updatetime=400
set shortmess=ac "http://vimdoc.sourceforge.net/htmldoc/options.html#'shortmess'

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"

"""golang
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd BufWritePre *.go :call CocAction('organizeImport')
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <localleader>c :GoRemoveTags<cr>
autocmd FileType go nmap <localleader>y :GoAddTags yaml<cr>
autocmd FileType go nmap <localleader>j :GoAddTags json<cr>
autocmd FileType go nmap <localleader>h :GoAddTags hcl<cr>
autocmd FileType go nmap <localleader>d :GoDoc
" autocmd FileType go nmap <localleader>b :DlvToggleBreakpoint<cr>
" autocmd FileType go nmap <localleader>d :DlvDebug<cr>
au FileType go nmap <localleader>g :GoDeclsDir<cr>
au FileType go nmap <localleader>a :GoAlternate<cr>
au FileType go nmap <localleader>t :GoTest -short<cr>
" GoCoverageToggle -short
" K
" [[ ]]
"

"""ruby
let g:ruby_operators=1
let g:ruby_pseudo_operators=1

"""clang
let g:clang_format#auto_format=1
let g:clang_format#detect_style_file=1
" autocmd BufWritePre *.c,*.cc,*.cpp,*.h,*.hh,*.hpp :Neoformat 
autocmd BufEnter *.cc nmap <C-k><C-j> :<C-u>e %:r.hh<CR>
autocmd BufEnter *.hh nmap <C-k><C-j> :<C-u>e %:r.cc<CR>
au FileType cpp nmap <localleader>a :FSHere<cr>
au FileType c nmap <localleader>a :FSHere<cr>
"

"""i3 / rofi / polybar / ...
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead *.rasi set filetype=css
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
"

"""fzf
"TODO
" let g:fzf_action = {
"   \ 'ctrl-b': 'split',
"   \ 'ctrl-v': 'vsplit' }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~80%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"

"""startify
" SSave
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]
          " \ { 'type': 'files',     'header': ['   Files']            },

let g:startify_bookmarks = [
            \ { 'hw': '~/hashira/app/wasm' },
            \ { 'hc': '~/hashira/cloud' },
            \ { 'hi': '~/hashira/infra' },
            \ { 'kr': '~/oh/krab' },
            \ { 'ci': '~/.config/i3/config' },
            \ { 'cr': '~/.config/rofi/config.rasi' },
            \ { 'cp': '~/.config/polybar/config.ini' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'b': '~/.bashrc' },
            \ ]

let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1
"

""""status line
"hi User1 guifg=#0a665a guibg=#111111
"hi User2 guifg=#69697c guibg=#111111
"hi User3 guifg=#ff66ff guibg=#111111
"hi User4 guifg=#0a665a guibg=#111111
"hi User5 guifg=#A843A8 guibg=#111111

"""status line
hi User1 guifg=#69697c guibg=#111111
hi User2 guifg=#69697c guibg=#111111
hi User3 guifg=#18ffe0 guibg=#111111
hi User4 guifg=#0a665a guibg=#111111
hi User5 guifg=#0a665a guibg=#111111

set statusline=
set statusline=%3*%5l%*            "lines
set statusline+=%2*/%L%1*%2*:%*            
set statusline+=%4*%-3v\ %*             "column
set statusline+=%1*%=
set statusline+=%5*\ \ %f\ \ %*            "path
set statusline+=%1*%=      
set statusline+=%2*\ \ %{&ft}\ \ %{&encoding}\ \ %1*            "file info
set statusline+=%3*\%{CurrentMode()}\ %*
set fillchars=stl:-,stlnc:-,fold:-,diff:-  "https://vimhelp.org/options.txt.html#%27fillchars%27

" statusline
function! CurrentMode()
  let l:mode = mode()

  if l:mode==#"n"
    return "N"
  elseif l:mode==?"v"
    return "V"
  elseif l:mode==?"V"
    return "V"
  elseif l:mode==#"i"
    return "I"
  elseif l:mode==#"R"
    return "R"
  elseif l:mode==#"Ctrl-V"
    return "B"
  endif
endfunction

