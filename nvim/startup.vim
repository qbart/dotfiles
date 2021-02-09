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
            \ { 'v': '~/.config/nvim/' },
            \ { 'b': '~/.bashrc' },
            \ ]

let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1
"
