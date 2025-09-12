#!/bin/bash
set -e

if command -v apt &>/dev/null; then
    sudo apt-get install --yes tmux
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm tmux
fi

if [[ ! -d ~/.tmux/plugins/tpm/ ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

