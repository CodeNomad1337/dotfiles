#!/bin/bash

if command -v apt &>/dev/null; then
    sudo apt install --yes fontconfig
elif command -v pacman &>/dev/null
    sudo pacman -S --noconfirm fontconfig
fi

cd ~
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
mkdir -p .local/share/fonts
unzip Meslo.zip -d .local/share/fonts
cd .local/share/fonts
rm *Windows*
cd ~
rm Meslo.zip
fc-cache -fv
