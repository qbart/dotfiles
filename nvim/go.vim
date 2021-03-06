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

let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 0
let g:go_metalinter_deadline = "5s"

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

autocmd FileType go nmap <localleader>tc :GoRemoveTags<cr>
autocmd FileType go nmap <localleader>ty :GoAddTags yaml<cr>
autocmd FileType go nmap <localleader>tj :GoAddTags json<cr>
autocmd FileType go nmap <localleader>th :GoAddTags hcl<cr>
autocmd FileType go nmap <localleader>td :GoAddTags db<cr>
autocmd FileType go nmap <localleader>d :GoDoc
" autocmd FileType go nmap <localleader>b :DlvToggleBreakpoint<cr>
" autocmd FileType go nmap <localleader>d :DlvDebug<cr>
au FileType go nmap <localleader>g :GoDeclsDir<cr>
au FileType go nmap <localleader>a :GoAlternate<cr>
au FileType go nmap <localleader>rt :GoTest -short<cr>

au FileType go nmap <localleader>[ :lnext<cr>
au FileType go nmap <localleader>{ :lprevious<cr>
au FileType go nmap <localleader>u :GoReferrers<cr>
au FileType go nmap <localleader>i :GoImpl 
" GoCoverageToggle -short
" K
" [[ ]]

" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd BufWritePre *.go :call CocAction('organizeImport')
