#!/bin/sh

defaults read | grep -i 'keyrepeat'
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
