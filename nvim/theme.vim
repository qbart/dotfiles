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

aug bash_ft_detection
  au!
  au BufRead .bash_theme,.bash_aliases,.bash_ps1,.bashrc set filetype=bash
aug end
