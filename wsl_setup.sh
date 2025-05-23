#!/bin/bash

mkdir -p ~/.config/

ln -s "$(pwd)/.vimrc" ~/.vimrc -f
ln -s "$(pwd)/nvim" ~/.config/nvim -f
ln -s "$(pwd)/byhost" ~/.config/byhost -f

ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases -f
ln -s "$(pwd)/.bashrc" ~/.bashrc -f

ln -f -s "$(pwd)/.terraformrc" ~/.terraformrc
#ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf -f

rm ~/.config/nvim/nvim
rm ~/.config/byhost/byhost
