#!/bin/bash

sudo pacman-mirrors -c Poland,Germany
sudo pacman -Syy
sudo pacman -Su

sudo pacman -S i3-wm i3lock i3status dmenu
sudo pacman -S bat fzf xclip exa
sudo pacman -S go cmake clang
sudo pacman -S docker

sudo systemctl enable docker
sudo systemctl start docker


xdg-settings set default-web-browser firefox.desktop
