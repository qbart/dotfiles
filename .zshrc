HISTFILE=$HOME/.zsh_history
SAVEHIST=5000
HISTSIZE=5000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

setopt CORRECT

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh