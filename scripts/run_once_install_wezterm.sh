#!/bin/bash
set -e

if command -v apt &>/dev/null; then
    sudo apt-get install --yes wezterm
elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm wezterm
fi

