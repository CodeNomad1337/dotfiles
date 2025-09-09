#!/bin/bash
set -e

if command -v apt &>/dev/null; then
  sudo apt-get install --yes zsh
elif command -v pacman &>/dev/null; then
  sudo pacman -Syu --noconfirm zsh
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

