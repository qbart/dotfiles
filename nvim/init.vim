call plug#begin()

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdTree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'rhysd/vim-clang-format'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'dominikduda/vim_current_word'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'derekwyatt/vim-fswitch'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-hclfmt'
Plug 'tpope/vim-commentary'

call plug#end()

"""various
set encoding=utf-8
set number " show line nums
syntax on
set cursorline " highlight current line
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set history=2000  
set undolevels=2000
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
nmap Q <Nop> "disable ex mode
set wrap!
"

"""theme
set background=dark
set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:airline='hard'
colorscheme gruvbox
let g:rainbow_active = 1 
let g:vim_current_word#highlight_current_word = 0
"

"""keybindings
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

nmap <C-k> :BLines<CR>
nmap <C-k><C-j> :Files<CR>
nmap <C-k><C-i> :Lines<CR>
"

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

"""clang
let g:clang_format#auto_format=0
let g:clang_format#detect_style_file=1
autocmd BufWritePre *.c,*.cc,*.cpp,*.h,*.hh,*.hpp :ClangFormat
autocmd BufEnter *.cc nmap <C-k><C-j> :<C-u>e %:r.hh<CR>
autocmd BufEnter *.hh nmap <C-k><C-j> :<C-u>e %:r.cc<CR>
"


" coc-json
" coc-yank
" coc-go
" coc-snippets

