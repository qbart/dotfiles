#!/bin/bash

mkdir -p ~/.secrets
touch ~/.secrets/load.sh
chmod +x ~/.secrets/load.sh
chmod 0700 ~/.secrets


ln -f -s "$(pwd)/.vimrc" ~/.vimrc
ln -f -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -f -s "$(pwd)/nvim" ~/.config/nvim
ln -f -s "$(pwd)/kitty" ~/.config/kitty
ln -f -s "$(pwd)/byhost" ~/.config/byhost

ln -f -s "$(pwd)/.bash_aliases" ~/.bash_aliases

ln -f -s "$(pwd)/.zshrc" ~/.zshrc
ln -f -s "$(pwd)/.zshenv" ~/.zshenv
ln -f -s "$(pwd)/.zprofile" ~/.zprofile
ln -f -s "$(pwd)/.zlogin" ~/.zlogin
ln -f -s "$(pwd)/.zlogout" ~/.zlogout
ln -f -s "$(pwd)/.zsh_ps1" ~/.zsh_ps1

ln -f -s "$(pwd)/.terraformrc" ~/.terraformrc

rm ~/.config/kitty/kitty
rm ~/.config/nvim/nvim
rm ~/.config/byhost/byhost
