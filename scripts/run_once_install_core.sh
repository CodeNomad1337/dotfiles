#!/bin/bash
set -e

if command -v apt &>/dev/null; then
    sudo apt-get install --yes --update \
        git curl python3-pip
elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm \
        git curl python-pip
fi

