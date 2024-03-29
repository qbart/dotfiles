#!/bin/bash

sudo pacman-mirrors -c Poland,Germany,United_Kingdom
sudo pacman -Syy
sudo pacman -Su

#source ./yay.sh

sudo pacman -S base-devel i3-wm i3lock rofi compton dunst noto-fonts-emoji mpd feh autorandr xorg-xwininfo xorg-input
sudo pacman -S bat xclip xsel copyq tmux httpie peek clipit screen ripgrep fd w3m autofs highlight tldr flameshot z kitty
sudo pacman -S go cmake clang neovim pavucontrol
sudo pacman -S docker
sudo pacman -S rofimoji
sudo pacman -S ttf-hack
sudo pacman -S pacman-static

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

xdg-settings set default-web-browser firefox.desktop
xdg-mime default firefox.desktop x-scheme-handler/https
xdg-mime default firefox.desktop x-scheme-handler/http
pip3 install pynvim

yay -S git-delta polybar
yay -S paper-icon-theme
yay -S rofi-calc
yay rofi-greenclip
yay -S nerd-fonts-complete
yay -S glow-bin
