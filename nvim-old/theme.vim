"""theme
set signcolumn=yes
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_delay = 200 "ms
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 0

colorscheme aurora

"""status line
set fillchars=stl:\ ,stlnc:\ ,fold:-,diff:-  "https://vimhelp.org/options.txt.html#%27fillchars%27
set statusline=%#StLine#%5l%*            "lines
set statusline+=%#StLineSep#:%*            
set statusline+=%#StColumn#%-3v\ %*             "column
set statusline+=%#StNoneSep#%=
set statusline+=%#StPath#\ \ %f\ \ %*            "path
set statusline+=%#StNoneSep#%=      
set statusline+=%#StInfo#\ \ %{&ft}\ \ %{&encoding}\ \ %#StAllLines#%L\ %#StNone#            "file info

" colors https://github.com/RRethy/vim-hexokinase
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'vim', 'dosini', 'conf', 'go']
let g:Hexokinase_highlighters = [
\   'virtual',
\ ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\ ]

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
