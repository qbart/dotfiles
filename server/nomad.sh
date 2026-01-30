#!/usr/bin/env bash
set -e

if ! which nomad >/dev/null 2>&1; then
      wget -O - https://apt.releases.hashicorp.com/gpg \
              | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
            https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" \
                | sudo tee /etc/apt/sources.list.d/hashicorp.list >/dev/null

          sudo apt update
            sudo apt install -y nomad
        else
              echo "nomad already installed"
fi

