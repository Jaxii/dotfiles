#!/bin/bash
# arch-setup.sh

# Update system
sudo pacman -Syu --noconfirm

# Install essential packages
sudo pacman -S --noconfirm \
    kitty \
    git \
    firefox \
    rustup \
    base-devel

# Install AUR helper (yay)
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd .. && rm -rf yay
fi

# Install AUR packages
yay -S --noconfirm vscodium

# Configure Kitty
mkdir -p ~/.config/kitty
cp ../kitty/kitty.conf ~/.config/kitty/
