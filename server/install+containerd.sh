#!/bin/bash
set -e

aliases="$HOME/.bash_aliases"
if [ ! -f "$aliases" ]; then
    touch $aliases
    echo "alias sc=systemctl" >> "$aliases"
    echo "alias jc=journalctl" >> "$aliases"
else
    echo "Aliases already added."
fi

if command -v containerd &> /dev/null
then
    echo "containerd already installed."
else
    apt update
    apt -y install ca-certificates curl vim wget gpg coreutils apt-transport-https containerd
    sudo mkdir /etc/containerd
    containerd config default | sudo tee /etc/containerd/config.toml
fi

