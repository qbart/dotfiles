#!/bin/bash

mkdir -p ~/bin
mkdir -p ~/.secrets
touch ~/.secrets/load.sh
chmod +x ~/.secrets/load.sh
chmod 0700 ~/.secrets


ln -s "$(pwd)/nvim" ~/.config/nvim -f
ln -s "$(pwd)/kitty" ~/.config/kitty -f
ln -s "$(pwd)/byhost" ~/.config/byhost -f

ln -s "$(pwd)/.bash_ps1" ~/.bash_ps1 -f
ln -s "$(pwd)/.bash_theme" ~/.bash_theme -f
ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases -f
ln -s "$(pwd)/.bashrc" ~/.bashrc -f
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf -f

rm ~/.config/kitty/kitty
rm ~/.config/nvim/nvim
rm ~/.config/byhost/byhost
