#!/bin/bash

mkdir -p ~/.config/i3
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty

ln -s "$(pwd)/i3/config" ~/.config/i3/config -f
ln -s "$(pwd)/i3/status.conf" ~/.config/i3/status.conf -f
ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases -f
ln -s "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim -f
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf -f
ln -s "$(pwd)/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml -f


ln -s "$(pwd)/sublime/Preferences.sublime-settings" ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings -f
ln -s "$(pwd)/sublime/linux.sublime-keymap" ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap -f
