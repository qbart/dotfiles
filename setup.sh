#!/bin/bash

mkdir -p ~/.secrets
touch ~/.secrets/load.sh
chmod +x ~/.secrets/load.sh
chmod 0700 ~/.secrets

ln -s "$(pwd)/nvim" ~/.config/nvim -f
ln -s "$(pwd)/i3" ~/.config/i3 -f
ln -s "$(pwd)/polybar" ~/.config/polybar -f
ln -s "$(pwd)/rofi" ~/.config/rofi -f
ln -s "$(pwd)/ranger" ~/.config/ranger -f
ln -s "$(pwd)/alacritty" ~/.config/alacritty -f
ln -s "$(pwd)/dunst" ~/.config/dunst -f
ln -s "$(pwd)/byhost" ~/.config/byhost -f

ln -s "$(pwd)/.bash_ps1" ~/.bash_ps1 -f
ln -s "$(pwd)/.bash_theme" ~/.bash_theme -f
ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases -f
ln -s "$(pwd)/.bashrc" ~/.bashrc -f

ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf -f

rm ~/.config/rofi/rofi
rm ~/.config/polybar/polybar
rm ~/.config/ranger/ranger
rm ~/.config/alacritty/alacritty
rm ~/.config/nvim/nvim
rm ~/.config/i3/i3
rm ~/.config/dunst/dunst
rm ~/.config/byhost/byhost
