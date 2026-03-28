#!/bin/bash

sudo pacman -S --needed --noconfirm base-devel findutils wget curl unzip zip inetutils impala libva-utils yay-bin paru ntfs-3g exfatprogs gum ly bluetui iwd

echo -e "\nEnter identification for git and autocomplete..."
export GIT_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export GIT_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

# Set identification from install inputs
if [[ -n "${GIT_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$GIT_USER_NAME"
fi

if [[ -n "${GIT_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$GIT_USER_EMAIL"
fi

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

sudo systemctl disable sddm.service
sudo systemctl disable getty@tty2.service
sudo systemctl enable ly@tty2.service

# Turn on bluetooth by default
sudo systemctl enable --now bluetooth.service

# Turn on iwd by default
sudo systemctl enable --now iwd.service
sudo systemctl enable --now systemd-resolved

sudo touch /etc/iwd/main.conf
cat >/etc/iwd/main.conf <<'EOF'
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
EOF

# DISABLE NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager
