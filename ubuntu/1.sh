#!/bin/bash

sudo apt install \
     vim git git-lfs cargo make fd-find curl cmake build-essential \
     htop tmux bat podman podman-compose flatpak qemu-system \
     xclip xsel peek flameshot pkg-config ninja-build

[ ! -f ~/.gitconfig ] && cp ../.gitconfig ~/.gitconfig
[ ! -f ~/bin/fd ] && ln -s $(which fdfind) ~/bin/fd
