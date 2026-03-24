#!/bin/bash

yay -S --noconfirm --needed \
  fd fzf ripgrep bat jq \
  wl-clipboard fastfetch btop \
  man less whois plocate \
  ghostty \
  zellij \
  zsh \
  ydotool gitk zip unzip

mkdir -p ~/.config/ghostty/

sudo usermod -aG input $USER
export YDOTOOL_SOCKET=/tmp/.ydotool_socket

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
