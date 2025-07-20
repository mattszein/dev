#!/bin/bash

yay -S --noconfirm --needed \
  fd fzf ripgrep bat jq \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate \
  alacritty \
  zellij

mkdir -p ~/.config/alacritty/
