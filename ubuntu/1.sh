#!/bin/bash

sudo apt install \
     vim git cargo make fd-find curl cmake build-essential \
     htop tmux bat kitty podman podman-compose flatpak qemu-system \
     xclip xsel peek flameshot

[ ! -f ~/.gitconfig ] && cp ../.gitconfig ~/.gitconfig
[ ! -f ~/bin/fd ] && ln -s $(which fdfind) ~/bin/fd


echo "Manually install:"
echo "  - eza from apt source"
echo "  - asdf as binary"
echo "  - git-delta via deb"
echo "  - nvim compile"

echo "Edit these files:"
echo "  - ~/.gitconfig and update missing"
