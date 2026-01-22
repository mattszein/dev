#!/bin/bash

yay -S --noconfirm --needed \
  fd fzf ripgrep bat jq \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate \
  ghostty \
  zellij \
  zsh \
  ydotool gitk zip unzip

mkdir -p ~/.config/ghostty/

sudo usermod -aG input $USER
export YDOTOOL_SOCKET=/tmp/.ydotool_socket
