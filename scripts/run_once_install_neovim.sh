#!/bin/bash
set -e

if command -v apt &>/dev/null; then
  sudo apt-get install --yes neovim
elif command -v pacman &>/dev/null; then
  sudo pacman -Syu --noconfirm neovim
fi

