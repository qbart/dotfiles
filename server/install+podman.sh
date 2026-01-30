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

if command -v podman &> /dev/null
then
    echo "Podman already installed."
else
    apt update
    apt -y install ca-certificates curl vim podman wget gpg coreutils
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --yes --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    apt update
    apt install -y nomad-driver-podman

    # podman rootless
    SYSCTL_FILE="/etc/sysctl.d/99-userns.conf"

    touch "$SYSCTL_FILE"

    grep -q '^kernel.unprivileged_userns_clone' "$SYSCTL_FILE" \
        || echo 'kernel.unprivileged_userns_clone = 1' >> "$SYSCTL_FILE"

    sysctl --system
fi

