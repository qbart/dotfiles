#!/bin/bash

mkdir -p ~/bin
mkdir -p ~/.secrets
touch ~/.secrets/load.sh
chmod +x ~/.secrets/load.sh
chmod 0700 ~/.secrets

[ ! -d ~/.config/nvim ] && ln -s "$(pwd)/../nvim" ~/.config/nvim
[ ! -d ~/.config/kitty ] && ln -s "$(pwd)/../kitty" ~/.config/kitty
[ ! -d ~/.config/byhost ] && ln -s "$(pwd)/../byhost" ~/.config/byhost

ln -sf "$(pwd)/../.bash_ps1" ~/.bash_ps1
ln -sf "$(pwd)/../.bash_theme" ~/.bash_theme
ln -sf "$(pwd)/../.bash_aliases" ~/.bash_aliases
ln -sf "$(pwd)/../.bashrc" ~/.bashrc
ln -sf "$(pwd)/../.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/../.vimrc" ~/.vimrc
