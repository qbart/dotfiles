call plug#begin()

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdTree'
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
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'sbdchd/neoformat'
Plug 'mboughaba/i3config.vim'
Plug 'qbart/vim-aurora'
Plug 'qbart/vim-cpp-modern'
" todo Plug 'andymass/vim-tradewinds'

call plug#end()

"TODO
"ctags -R .
"set wildignore+=**/node_modules/**
"nnoremap ,html :-1read $HOME/.config/nvim/tpl/cpp_class.cc<CR>3jwf>a

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

set number " show line nums
syntax on
set cursorline " highlight current line
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set history=10000
set undolevels=2000
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
nmap Q <Nop> "disable ex mode
set wrap!
set textwidth=0 " no wordwrap
set wrapmargin=0
set splitright
set splitbelow
" set lazyredraw
set noswapfile
set novisualbell
set smartindent
set smartcase

"zen
let g:goyo_width=110
"

"""theme
let g:polyglot_disabled = ['cpp']
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

set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:vim_current_word#highlight_current_word = 0
let g:lightline = {
      \ 'colorscheme': 'ThemerVimLightline',
      \ }
" let g:rainbow_active = 1
colorscheme aurora
"

"""comments
nmap // <Plug>CommentaryLine
xmap /  <Plug>Commentary
nmap /  <Plug>Commentary
omap /  <Plug>Commentary

""" nav
" let g:tradewinds_no_maps = 1

" nnoremap <silent> <c-w>g<left>  :TradewindsMove h<cr>
" nnoremap <silent> <c-w>g<down>  :TradewindsMove j<cr>
" nnoremap <silent> <c-w>g<up>    :TradewindsMove k<cr>
" nnoremap <silent> <c-w>g<right> :TradewindsMove l<cr>

"""keybindings
nmap K <nop>
imap jk <ESC>

" natural order consistent with i3
noremap ; l
noremap l k
noremap k j
noremap j h

nmap <C-k><C-h> :NERDTreeToggle<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-k><C-k> :sp<CR>
nmap <C-k><C-l> :vs<CR>

nnoremap <C-p>  :<C-u>CocList -A --normal yank<cr>

nmap <C-f> :BLines<CR>
nmap <C-k><C-j> :Files<CR>
nmap <C-k><C-i> :Rg<CR>

map <C-z> :Goyo<CR>
"

"""TF
let g:terraform_fmt_on_save=1


"""coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtc :CocCommand go.tags.clear<cr>
"

"""ruby
let g:ruby_operators=1
let g:ruby_pseudo_operators=1

"""clang
let g:clang_format#auto_format=0
let g:clang_format#detect_style_file=1
autocmd BufWritePre *.c,*.cc,*.cpp,*.h,*.hh,*.hpp :Neoformat
autocmd BufEnter *.cc nmap <C-k><C-j> :<C-u>e %:r.hh<CR>
autocmd BufEnter *.hh nmap <C-k><C-j> :<C-u>e %:r.cc<CR>
"

"""i3
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
"


" coc-json
" coc-yank
" coc-go
" coc-snippets

""" close tags
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
