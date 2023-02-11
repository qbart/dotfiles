#!/bin/bash

mkdir -p ~/.secrets
touch ~/.secrets/load.sh
chmod +x ~/.secrets/load.sh
chmod 0700 ~/.secrets


ln -s "$(pwd)/nvim" ~/.config/nvim -f
ln -s "$(pwd)/i3" ~/.i3 -f
ln -s "$(pwd)/polybar" ~/.config/polybar -f
ln -s "$(pwd)/rofi" ~/.config/rofi -f
ln -s "$(pwd)/flameshot" ~/.config/flameshot -f
ln -s "$(pwd)/lf" ~/.config/lf -f
ln -s "$(pwd)/kitty" ~/.config/kitty -f
ln -s "$(pwd)/dunst" ~/.config/dunst -f
ln -s "$(pwd)/byhost" ~/.config/byhost -f

ln -s "$(pwd)/.bash_ps1" ~/.bash_ps1 -f
ln -s "$(pwd)/.bash_theme" ~/.bash_theme -f
ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases -f
ln -s "$(pwd)/.bashrc" ~/.bashrc -f

ln -s "$(pwd)/.zshrc" ~/.zshrc -f
ln -s "$(pwd)/.zshenv" ~/.zshenv -f
ln -s "$(pwd)/.zprofile" ~/.zprofile -f
ln -s "$(pwd)/.zlogin" ~/.zlogin -f
ln -s "$(pwd)/.zlogout" ~/.zlogout -f

ln -s "$(pwd)/manjaro/mimeapps.list" ~/.config/mimeapps.list -f
ln -s "$(pwd)/greenclip.cfg" ~/.config/greenclip.cfg -f
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf -f

ln -s -f "$(pwd)/bin/open" ~/bin/open
ln -s -f "$(pwd)/bin/ck" ~/bin/ck

rm ~/.config/rofi/rofi
rm ~/.config/flameshot/flameshot
rm ~/.config/polybar/polybar
rm ~/.config/lf/lf
rm ~/.config/kitty/kitty
rm ~/.config/nvim/nvim
rm ~/.i3/i3
rm ~/.config/dunst/dunst
rm ~/.config/byhost/byhost
