#!/bin/bash
set -e

if command -v wezterm &>/dev/null; then
    exit 0
fi

if command -v apt &>/dev/null; then
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
    sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
    sudo apt-get update
    sudo apt-get install --yes wezterm
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm wezterm
fi

