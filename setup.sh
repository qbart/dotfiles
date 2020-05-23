#!/bin/bash

mkdir -p ~/.config/i3
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.config/nvim/autoload/lightline/colorscheme
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/dunst
mkdir -p ~/.config/ranger

ln -s "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim -f
ln -s "$(pwd)/i3/status.conf" ~/.config/i3/status.conf -f
ln -s "$(pwd)/i3/compton.conf" ~/.config/i3/compton.conf -f
ln -s "$(pwd)/polybar" ~/.config/polybar/
ln -s "$(pwd)/ranger/rc.conf" ~/.config/ranger/rc.conf -f

ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases -f
ln -s "$(pwd)/.bashrc" ~/.bashrc -f

ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf -f
ln -s "$(pwd)/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml -f

ln -s "$(pwd)/sublime/Preferences.sublime-settings" ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings -f
ln -s "$(pwd)/sublime/linux.sublime-keymap" ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap -f
