# os
alias ll='ls -alF'
alias la='ls -A'
alias l='exa -h'
alias pp='cd ~/projects'
alias tgz='tar -cvzf'
alias untgz='tar -xvzf'
alias apts='apt search'
alias apti='sudo apt -y install'
alias aptu='sudo apt update'
alias aptr='sudo apt remove'
alias aptug='sudo apt upgrade'
alias addppa='sudo add-apt-repository'
alias mkdirtoday1='mkdir $(date -I)'
alias mkdirtoday3='mkdir -p $(date -I | tr "-" "/")'
alias cdruby='cd ~/projects/ruby'
alias cdcrystal='cd ~/projects/crystal'
alias cdrust='cd ~/projects/rust'
alias cdcpp='cd ~/projects/cpp'
alias cdcs='cd ~/projects/cs'

# ruby
alias rr='rails'
alias rornew='rails new --database=postgresql --skip-action-mailer --skip-active-storage --skip-action-cable --skip-coffee --skip-spring --skip-turbolinks --skip-test --skip-system-test'
alias be='bundle exec'
alias pumcia='bundle exec puma -C config/puma.rb'
alias fspec='spring rspec'
alias ffspec='spring rspec --only-failures'
alias dbmigrate='bundle exec rake db:migrate'
alias dbmigratetest='RAILS_ENV=test bundle exec rake db:migrate'
alias dbseed='bundle exec rake db:seed'

# git
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

# elixir
alias imx='iex -S mix'
alias ms='mix phx.server'
alias imxp='imx phx.server'

# tools
alias vv='vim .'
alias tt='tmux'

# docker
alias dc='docker-compose'
alias dcdev='docker-compose -f docker-compose.dev.yml'

# crystal
alias cspec='crystal spec'
alias crdev='heroku local -f Procfile.dev'

# curl
alias postjson='curl -X POST -H "Content-Type: application/json" -d'
alias getjson='curl -X GET -H "Content-Type: application/json"'
alias json='curl -H "Content-Type: application/json"'

# other
alias loc='xargs wc -l'

function open() {
  nautilus $1 2>/dev/null || dolphin $1 2>/dev/null
}
