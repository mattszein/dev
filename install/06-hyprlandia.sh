#!/bin/bash

yay -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle polkit-gnome hyprland-guiutils \
  waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wiremix

# Hyprland launched via UWSM and login directly as user
yay -S --noconfirm --needed uwsm

# cp -r /usr/share/hypr ~/.config/
