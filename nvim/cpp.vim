let g:cpp_class_scope_highlight = 1
let g:cpp_named_requirements_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:clang_format#auto_format=0
let g:clang_format#detect_style_file=1

augroup plugin-clang-format-auto-format
" autocmd BufWritePre *.c,*.cc,*.cpp,*.h,*.hh,*.hpp :Neoformat 
    autocmd!
    autocmd BufWritePre *
        \ if &ft =~# '^\%(c\|cpp\|objc\|java\|proto\|arduino\)$' &&
        \     g:clang_format#auto_format &&
        \     !clang_format#is_invalid() |
        \     call clang_format#replace(1, line('$')) |
        \ endif
    autocmd FileType c,cpp,objc,java,javascript,typescript,proto,arduino
        \ if g:clang_format#auto_formatexpr &&
        \     !clang_format#is_invalid() |
        \     setlocal formatexpr=clang_format#replace(v:lnum,v:lnum+v:count-1) |
        \ endif
augroup END
autocmd BufEnter *.cc nmap <C-k><C-j> :<C-u>e %:r.hh<CR>
autocmd BufEnter *.hh nmap <C-k><C-j> :<C-u>e %:r.cc<CR>
au FileType cpp nmap <localleader>a :FSHere<cr>
au FileType c nmap <localleader>a :FSHere<cr>

autocmd FileType c,cpp setlocal commentstring=//\ %s
