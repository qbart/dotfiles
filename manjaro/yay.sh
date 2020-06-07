#!/bin/bash

cd /tmp
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

