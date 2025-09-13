#!/bin/bash

if command -v apt &>/dev/null; then
    sudo apt install --yes i3-wm i3blocks i3lock i3status feh
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm i3-wm i3blocks i3lock i3status feh
fi

