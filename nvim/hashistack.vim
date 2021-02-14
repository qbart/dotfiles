let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1

au BufWritePre {*.hcl,*.nomad} call terraform#fmt()
