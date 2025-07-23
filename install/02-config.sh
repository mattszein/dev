#!/bin/bash

# Need gum to query for input
yay -S --noconfirm --needed gum ly

# Configure identification
echo -e "\nEnter identification for git and autocomplete..."
export GIT_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export GIT_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

# Setup GPG configuration with multiple keyservers for better reliability
# sudo mkdir -p /etc/gnupg
# sudo cp ~/.local/share/omarchy/default/gpg/dirmngr.conf /etc/gnupg/
# sudo chmod 644 /etc/gnupg/dirmngr.conf
# sudo gpgconf --kill dirmngr || true
# sudo gpgconf --launch dirmngr || true

# Set identification from install inputs
if [[ -n "${GIT_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$GIT_USER_NAME"
fi

if [[ -n "${GIT_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$GIT_USER_EMAIL"
fi

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Copy over Omarchy configs
# cp -R ./config/* ~/.config/

systemctl enable ly.service
systemctl disable getty@tty2.service
