#!/bin/sh

defaults read | grep -i 'keyrepeat'
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1
