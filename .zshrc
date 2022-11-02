HISTFILE=$HOME/.zsh_history
SAVEHIST=50000
HISTSIZE=50000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt PROMPT_SUBST

setopt CORRECT

[ -f ~/.config/byhost/$(hostname).sh ] && source ~/.config/byhost/$(hostname).sh

export VISUAL=nvim 
export EDITOR=nvim

# ----- aliases -----
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.zsh_ps1 ] && source ~/.zsh_ps1

# ----- envs -----
PATH=$PATH:$HOME/.asdf/shims:$HOME/.asdf/bin
PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:/bin:$HOME/.fzf/bin


if [ -d "/opt/apache-maven-3.8.5/bin" ]; then 
  PATH=$PATH:/opt/apache-maven-3.8.5/bin
fi

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .fzf --exclude .cache --exclude node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export BAT_THEME='Monokai Extended'

# ----- 3rd party - fzf -----
_fzf_complete_edit() {
  _fzf_complete --multi --reverse --prompt="edit> " --preview 'bat --style=numbers --color=always {} | head -100' -- "$@" < <(
    $FZF_DEFAULT_COMMAND
  )
}

# ----- 3rd party - asdf -----
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/lf/lficons.sh ] && source ~/.config/lf/lficons.sh

# ----- secrets -----
[ -f ~/.secrets/load.sh ] && source ~/.secrets/load.sh


# ----- sdk ----
if [ -f "$HOME/sdk/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/sdk/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/sdk/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/sdk/google-cloud-sdk/completion.zsh.inc"; fi
if [ -d "$HOME/sdk/pico" ]; then 
  export PICO_SDK_PATH=$HOME/sdk/pico
fi
