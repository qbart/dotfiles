#!/bin/bash

sudo apt install vim git cargo make fd-find curl cmake build-essential htop tmux bat kitty podman
[ ! -f ~/.gitconfig ] && cp ../.gitconfig ~/.gitconfig

ln -s $(which fdfind) ~/bin/fd


echo "Manually:"
echo "TODO: install eza from apt source"
echo "TODO: install asdf as binary"
echo "TODO: install git-delta via deb"
echo "TODO: compile nvim"
echo "TODO: edit ~/.gitconfig and update missing"
