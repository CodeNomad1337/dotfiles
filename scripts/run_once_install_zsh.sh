#!/bin/bash
set -e

if command -v apt &>/dev/null; then
    sudo apt-get install --yes zsh
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm zsh
fi

if [[ ! -d ~/.oh-my-zsh/ ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s $(which zsh)
fi

if [[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k/ ]]
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    sed -i 's#^ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#' ~/.zshrc
fi

