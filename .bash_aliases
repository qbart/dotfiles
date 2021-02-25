# os
# alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias o='thunar .'
alias v='nvim'
alias e='nvim'
alias edit='nvim'
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias jc='sudo journalctl'
alias pac='sudo pacman'
alias sudo='sudo '
alias ls='exa'
alias lst='exa -T'
alias ll='exa -lha -bhl --git --group-directories-first'
alias l='ls -a'
alias f='fzf'
alias dnd='dragon'
alias tgz='tar -cvzf'
alias untgz='tar -xvzf'
alias tarls='tar -tvf'
alias apts='apt search'
alias apti='sudo apt -y install'
alias aptu='sudo apt update'
alias aptr='sudo apt remove'
alias aptug='sudo apt upgrade'
alias addppa='sudo add-apt-repository'
alias srcbrc='source ~/.bashrc'
alias mkdirtoday1='mkdir $(date -I)'
alias mkdirtoday3='mkdir -p $(date -I | tr "-" "/")'
alias cat='bat -p'
alias ra='source ~/.bash_aliases'
alias ea='nvim ~/.bash_aliases'
alias c='rsync -ah --inplace --info=progress2'
alias mountntfs='sudo mount -t ntfs -o nls=utf8,umask=0222'
alias lsntfs='sudo fdisk -l | grep NTFS'
alias mountexfat='sudo mount -t exfat'
alias lsexfat='sudo fdisk -l | rg exFAT'
alias cdprints='cd /var/spool/cups-pdf/$USER'

# c++
alias pmake=premake5

# ruby
alias rr='bundle exec rails'
alias rs='bundle exec rspec'
alias rgm='bundle exec rails g migration'
alias rdm='bundle exec rails db:migrate'
alias rdmd='bundle exec rails db:migrate:down'
alias rdr='bundle exec rails db:rollback'
alias rdd='bundle exec rails db:drop'
alias rdc='bundle exec rails db:create'
alias rdmr='bundle exec rails db:migrate:redo'
alias rdtp='bundle exec rails db:test:prepare'
alias rds='bundle exec rails db:seed'
alias be='bundle exec'
alias ber='bundle exec rails'
alias bers='bundle exec rspec'
alias rornew='rails new --database=postgresql --skip-action-mailer --skip-active-storage --skip-action-cable --skip-spring --skip-turbolinks --skip-test --skip-system-test'

# ssh
alias sshh='ssh -i $HOME/.ssh/$HCLOUD_PEM root@$(hcloud server list | grep -v "IPV" | fzf | awk '"'"'{print $4}'"'"'  )'
alias scph='scp -i $HOME/.ssh/$HCLOUD_PEM' 

# python
alias py='python3'
# git
alias rebasem='git pull --rebase --autostash origin master'
alias rebasec='git rebase --continue'
alias rebaseb='git pull --rebase --autostash origin'
alias rebasebff='git pull --rebase --autostash origin $(  git branch | grep -v "*" | fzf | awk '"'"'{print $1;}'"'"'  )'
alias rebase5='git rebase --autostash -i HEAD~5'
alias rebasei='git rebase --autostash -i'
alias merge='git merge --ff-only -'
alias amendch='git commit --amend -CHEAD'
alias amend='git commit --amend'
alias ci='git commit -m'
alias push='git push origin HEAD'
alias pushu='git push -u origin HEAD'
alias pushf='git push --force-with-lease origin HEAD'
alias pushhm='git push heroku master'
alias pull='git pull'
alias cob='git checkout -b'
alias co='git checkout'
alias gan='git add -N'
alias gap='git add -p'
alias gt='git tag'
alias gd='git diff'
alias gdc='git diff --cached'
alias gfo='git fetch origin'
alias gat='git tag -m "Set version" -a'
alias gl='git log --oneline -20 --color=always'
alias gll='git log --oneline -200 --color=always'
alias st='git status'
alias brm='git branch -D'
alias br='echo && git branch'
alias gg='git switch $(  git branch | grep -v "*" | fzf | awk '"'"'{print $1;}'"'"'  )'
alias wip='git commit -m "wip"'

# terraform
alias tf='terraform'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfaaa='terraform apply -auto-approve'
alias tfi='terraform init'
alias tfv='terraform validate'
tfmod() {
  mkdir -p "$1" && touch "$1"/{main.tf,variables.tf,output.tf} && echo -e "# $1\n\n## Usage\n\n## Output" >> "$1/README.md"
}

# go
alias gohot='air -c air.conf'
alias khr='dev ssh known-hosts reset'

# elixir
export ERL_AFLAGS="-kernel shell_history enabled"
alias iex='iex --erl "-kernel shell_history enabled"'
alias im='iex -S mix'
alias imt='iex -S mix test'
alias imps='iex -S mix phx.server'
alias mps='mix phx.server'
alias mem='mix ecto.migrate'
alias mer='mix ecto.rollback'
alias megm='mix ecto.gen.migration'
alias phx.new='mix phx.new --no-webpack --no-ecto --no-html'

# tools
alias asdfu='asdf plugin update --all'
alias vv='nvim .'
alias tt='tmux'
alias uuid4='uuid -v4'
alias removedash='sed '"'"'s/-//g'"'"''

# docker
alias dsh='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) sh'
alias dbash='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) bash'
alias drm='docker rm $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  )'
alias drma='docker rm $(  docker ps -a | fzf | awk '"'"'{print $1;}'"'"'  )'
alias d='docker'
alias dc='docker-compose'
alias dcdev='docker-compose -f docker-compose.dev.yml'

# kubernetes
alias k='kubectl'
alias ka='kubectl apply'
alias kd='kubectl describe'

# crystal
alias cspec='crystal spec'
alias crdev='heroku local -f Procfile.dev'

# curl
alias postjson='curl -X POST -H "Content-Type: application/json" -d'
alias getjson='curl -X GET -H "Content-Type: application/json"'
alias json='curl -H "Content-Type: application/json"'

# aws
alias install-awscli='pip install awscli --upgrade --user'

# heroku
alias hr='heroku run'

# other
alias loc='xargs wc -l'
alias restartpolybar='~/.config/polybar/launch.sh'

#
# utils
#

# ex - archive extractor
# usage: ex <file>
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
