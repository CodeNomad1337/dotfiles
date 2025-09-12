#!/bin/bash
set -e

if command -v nvim; then
    exit 0
fi

if command -v apt &>/dev/null; then
    sudo apt-get install --yes neovim
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm neovim
fi

