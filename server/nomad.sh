#!/usr/bin/env bash
set -e

if ! which nomad >/dev/null 2>&1; then
    wget -O - https://apt.releases.hashicorp.com/gpg \
        | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" \
        | tee /etc/apt/sources.list.d/hashicorp.list >/dev/null

    apt update
    apt install -y nomad


    # sysctl rules
    SYSCTL_FILE="/etc/sysctl.d/bridge.conf"

    mkdir -p /etc/sysctl.d
    touch "$SYSCTL_FILE"

    grep -q '^net.bridge.bridge-nf-call-arptables' "$SYSCTL_FILE" \
        || echo 'net.bridge.bridge-nf-call-arptables = 1' >> "$SYSCTL_FILE"

    grep -q '^net.bridge.bridge-nf-call-ip6tables' "$SYSCTL_FILE" \
        || echo 'net.bridge.bridge-nf-call-ip6tables = 1' >> "$SYSCTL_FILE"

    grep -q '^net.bridge.bridge-nf-call-iptables' "$SYSCTL_FILE" \
        || echo 'net.bridge.bridge-nf-call-iptables = 1' >> "$SYSCTL_FILE"

    sysctl --system

    # cni
    export ARCH_CNI=$( [ $(uname -m) = aarch64 ] && echo arm64 || echo amd64)
    export CNI_PLUGIN_VERSION=v1.6.2
    curl -L -o cni-plugins.tgz "https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGIN_VERSION}/cni-plugins-linux-${ARCH_CNI}-${CNI_PLUGIN_VERSION}".tgz && \
        mkdir -p /opt/cni/bin && \
        tar -C /opt/cni/bin -xzf cni-plugins.tgz
else
    echo "nomad already installed"
fi

