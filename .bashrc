#
# ~/.bashrc
#

[[ $- != *i* ]] && return

xhost +local:root > /dev/null 2>&1

# ----- autocomplete -----
complete -cf sudo
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
complete -F _fzf_complete_edit -o default -o bashdefault edit
complete -F _fzf_complete_edit e
complete -C $HOME/.asdf/shims/vault vault
complete -C $HOME/.asdf/shims/consul consul
complete -C $HOME/.asdf/shims/nomad nomad
which hcloud &> /dev/null && source <(hcloud completion bash)

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases


# Enable history appending instead of overwriting.  #139609
shopt -s histappend
export HISTFILESIZE=
export HISTSIZE=

source ~/.config/byhost/$(hostname).sh

# ----- aliases -----
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# ----- envs -----
# export QT_SELECT=4
export GOPATH=$HOME/go
export PATH=$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin
export PATH=$PATH:$HOME/.asdf/shims:$HOME/.asdf/bin
export PATH=$PATH:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:/bin:$HOME/.fzf/bin
export PATH=$PATH:$GOPATH/bin
export VISUAL=nvim # ranger
export EDITOR=nvim
export RANGER_LOAD_DEFAULT_RC=FALSE

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .fzf --exclude .cache --exclude node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export BAT_THEME='Monokai Extended'

# c++
export CC=clang
export CXX=clang++

# ----- 3rd party - fzf -----
_fzf_complete_edit() {
  _fzf_complete --multi --reverse --prompt="edit> " --preview 'bat --style=numbers --color=always {} | head -100' -- "$@" < <(
    $FZF_DEFAULT_COMMAND
  )
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# ----- 3rd party - z -----
[ -f /usr/share/z/z.sh ] && . /usr/share/z/z.sh

# ----- 3rd party - asdf -----
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# ----- theme -----
[ -f ~/.bash_theme ] && source ~/.bash_theme

# ----- secrets -----
[ -f ~/.secrets/load.sh ] && source ~/.secrets/load.sh

