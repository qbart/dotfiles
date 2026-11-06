#!/usr/bin/env bash
set -e

sudo apt update
sudo apt install nvidia-driver-595-open "linux-modules-nvidia-595-open-generic-hwe-$(lsb_release -rs)"
