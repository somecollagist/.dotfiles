#!/bin/bash

rm -rf ~/.config
ln -s ~/.dotfiles/.config ~/.config

PACMAN_PACKAGES=`cat ~/.dotfiles/pacman-packages.txt`
AUR_PACKAGES=`cat ~/.dotfiles/aur-packages.txt`

sudo pacman -S $PACMAN_PACKAGES --needed --no-confirm

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chmod 777 yay-git
cd yay-git
makepkg -si

yay -S $AUR_PACKAGES --needed --no-confirm

sudo systemctl enable --now iwd
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now sddm
sudo systemctl enable --now tlp