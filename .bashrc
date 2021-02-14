#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*|alacritty*)
		PROMPT_COMMAND='echo -ne "\033];${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM

match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

function __git_ps1 {
    git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\*\ \(.+\)$/\[\ \\1\ \]/
}

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		# PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
        PS1='\[\033[32m\]\[\033[37m\]\w\[\033[32m\] $(__git_ps1)\n$\[\033[00m\] '
	fi

	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

[ -f ~/.local/share/lscolors.sh ] && source ~/.local/share/lscolors.sh

# alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend
export HISTFILESIZE=
export HISTSIZE=

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

source ~/.config/byhost/$(hostname).sh
# ----- aliases -----
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# ----- envs -----
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

# tools
## fzf
_fzf_complete_edit() {
  _fzf_complete --multi --reverse --prompt="edit> " --preview 'bat --style=numbers --color=always {} | head -100' -- "$@" < <(
    $FZF_DEFAULT_COMMAND
  )
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# ----- asdf -----
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# ----- autocomplete -----
complete -F _fzf_complete_edit -o default -o bashdefault edit
complete -F _fzf_complete_edit e
complete -C $HOME/.asdf/shims/vault vault
complete -C $HOME/.asdf/shims/consul consul
complete -C $HOME/.asdf/shims/nomad nomad
source ~/.config/timelog/autocomplete.sh
which hcloud &> /dev/null && source <(hcloud completion bash)

# ----- secrets -----
[ -f ~/.secrets/load.sh ] && source ~/.secrets/load.sh


