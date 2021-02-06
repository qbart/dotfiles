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
" au FileType go nmap <localleader>( :cprevious<cr>
" au FileType go nmap <localleader>& :cnext<cr>
" GoCoverageToggle -short
" K
" [[ ]]

