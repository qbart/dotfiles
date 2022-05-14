#!/bin/bash

mkdir -p ~/.secrets
touch ~/.secrets/load.sh
chmod +x ~/.secrets/load.sh
chmod 0700 ~/.secrets


ln -f -s "$(pwd)/nvim-lua" ~/.config/nvim 
ln -f -s "$(pwd)/lf" ~/.config/lf 
ln -f -s "$(pwd)/kitty" ~/Library/Preferences/kitty 
ln -f -s "$(pwd)/byhost" ~/.config/byhost 

ln -f -s "$(pwd)/.bash_aliases" ~/.bash_aliases 

ln -f -s "$(pwd)/.zshrc" ~/.zshrc 
ln -f -s "$(pwd)/.zshenv" ~/.zshenv 
ln -f -s "$(pwd)/.zprofile" ~/.zprofile 
ln -f -s "$(pwd)/.zlogin" ~/.zlogin 
ln -f -s "$(pwd)/.zlogout" ~/.zlogout 
ln -f -s "$(pwd)/.zsh_ps1" ~/.zsh_ps1 

rm ~/.config/lf/lf
rm ~/Library/Preferences/kitty/kitty
rm ~/.config/nvim/nvim-lua
rm ~/.config/byhost/byhost
