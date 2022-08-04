#!/bin/bash

if [[ "$OSTYPE" == 'darwin'* ]]; then
    ln -sf "$(pwd)/nvim-vscode/settings.json" ~/Library/"Application Support"/Code/User/settings.json
    ln -sf "$(pwd)/nvim-vscode/keybindings.json" ~/Library/"Application Support"/Code/User/keybindings.json

    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
else
    ln -sf "$(pwd)/nvim-vscode/settings.json" ~/.config/"Code - OSS"/User/settings.json
    ln -sf "$(pwd)/nvim-vscode/keybindings.json" ~/.config/"Code - OSS"/User/keybindings.json
fi

