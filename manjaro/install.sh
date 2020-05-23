#!/bin/bash

sudo pacman-mirrors -c Poland,Germany,United_Kingdom
sudo pacman -Syy
sudo pacman -Su

sudo pacman -S i3-gaps i3lock rofi compton dunst noto-fonts-emoji rxvt-unicode mpd
sudo pacman -S bat xclip exa alacritty tmux httpie peek clipit screen ripgrep fd w3m autofs
sudo pacman -S go cmake clang neovim
sudo pacman -S docker

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

xdg-settings set default-web-browser firefox.desktop
pip3 install pynvim

yay -S git-delta polybar
yay -S paper-icon-theme

sudo pacman -R xfce4-notifyd
systemctl enable --user dunst.service

