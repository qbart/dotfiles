#!/bin/bash

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
    apt -y install ca-certificates curl vim podman

    # podman rootless
    SYSCTL_FILE="/etc/sysctl.d/99-userns.conf"

    touch "$SYSCTL_FILE"

    grep -q '^kernel.unprivileged_userns_clone' "$SYSCTL_FILE" \
        || echo 'kernel.unprivileged_userns_clone = 1' >> "$SYSCTL_FILE"

    sysctl --system
fi

