#!/bin/bash

sudo pacman-mirrors -c Poland,Germany,United_Kingdom
sudo pacman -Syy
sudo pacman -Su

#source ./yay.sh

sudo pacman -S base-devel i3-gaps i3lock rofi compton dunst noto-fonts-emoji mpd feh autorandr xorg-xwininfo xorg-input
sudo pacman -S bat xclip xsel copyq exa alacritty tmux httpie peek clipit screen ripgrep fd w3m autofs highlight ranger tldr flameshot z 
sudo pacman -S go cmake clang neovim pavucontrol
sudo pacman -S docker
sudo pacman -S rofimoji 

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

xdg-settings set default-web-browser firefox.desktop
pip3 install pynvim

yay -S git-delta polybar
yay -S paper-icon-theme
yay -S rofi-calc
yay rofi-greenclip
yay -S nerd-fonts-complete
yay -S glow-bin
