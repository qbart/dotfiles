alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias open='dolphin'

alias json='curl -H "Content-Type: application/json"'

alias tgz='tar -cvzf'
alias untgz='tar -xvzf'
alias apts='apt search'
alias apti='sudo apt -y install'
alias aptu='sudo apt update'
alias aptr='sudo apt remove'
alias aptug='sudo apt upgrade'
alias addppa='sudo add-apt-repository'

# ruby
alias rr='rails'
alias be='bundle exec'
alias fspec='spring rspec'
alias ffspec='spring rspec --only-failures'
alias dbmigrate='bundle exec rake db:migrate'
alias dbmigratetest='RAILS_ENV=test bundle exec rake db:migrate'
alias dbseed='bundle exec rake db:seed'
alias isp='invoker start Procfile.dev'
alias ssisp='spring stop && invoker start Procfile.dev'

alias rebasem='git pull --rebase --autostash origin master'
alias rebaseb='git pull --rebase --autostash origin'
alias rebase5='git rebase -i HEAD~5'
alias merge='git merge --ff-only -'
alias amend='git commit --amend -CHEAD'
alias commit='git commit -m'
alias push='git push origin HEAD'
alias pushf='git push --force-with-lease origin HEAD'
alias pull='git pull'
alias gan='git add -N'
alias gap='git add -p'

alias imx='iex -S mix'
alias ms='mix phx.server'
alias imxp='imx phx.server'

alias vv='vim .'
alias tt='tmux'
alias dc='docker-compose'
alias dcdev='docker-compose -f docker-compose.dev.yml'

# crystal
alias cspec='crystal spec'

# curl
alias postjson='curl -X POST -H "Content-Type: application/json" -d'
alias getjson='curl -X GET -H "Content-Type: application/json"'

if [ -f ~/.bash_aliases.projects ]; then
    . ~/.bash_aliases.projects
fi

