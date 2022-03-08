" i3 / rofi / polybar
"
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead *.rasi set filetype=css
  au BufNewFile,BufRead ~/.i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" caddy
"
aug caddy_ft_detection
  au!
  au BufNewFile,BufRead *.Caddyfile,Caddyfile set filetype=caddyfile
aug end

" bash
"
aug bash_ft_detection
  au!
  au BufRead .bash_theme,.bash_aliases,.bash_ps1,.bashrc set filetype=bash
aug end

" krab.hcl
"
aug krab_ft_detection
  au!
  au BufNewFile,BufRead *.krab.hcl set filetype=hcl
aug end

" crystal
"
aug crystal_ft_detection
  au!
  au BufRead shard.lock set filetype=yaml
aug end

" hashistack
"
aug hashistack_ft_detection
  au!
  au BufRead *.nomad,*.nomad.tpl set filetype=hcl
aug end
