#!/bin/bash

paru -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle polkit-gnome hyprland-guiutils hyprsunset \
  waybar mako hyprland-preview-share-picker-git hyprpaper \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wiremix

# Hyprland launched via UWSM and login directly as user
paru -S --noconfirm --needed uwsm

systemctl --user enable --now hyprpaper.service
