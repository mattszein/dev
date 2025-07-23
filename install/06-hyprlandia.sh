#!/bin/bash

yay -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle polkit-gnome hyprland-qtutils \
  walker waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Hyprland launched via UWSM and login directly as user
yay -S --noconfirm --needed uwsm

# Create ly xinitrc config
create_xinitrc() {
  XINITRC_FILE="$HOME/.xinitrc"

  # Check if file already exists
  if [ -f "$XINITRC_FILE" ]; then
    echo "Warning: $XINITRC_FILE already exists. Creating backup..."
    cp "$XINITRC_FILE" "$XINITRC_FILE.backup.$(date +%Y%m%d_%H%M%S)"
  fi

  echo "Creating $XINITRC_FILE..."

  # Create the .xinitrc file (overwrite if exists)
  cat >"$XINITRC_FILE" <<'EOF'
#!/bin/sh

# Enable logging for debugging (optional)
# exec > ~/.cache/xinitrc.log 2>&1

# Set up environment variables
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland

# Check if uwsm is available
if ! command -v uwsm >/dev/null 2>&1; then
    echo "Error: uwsm not found in PATH"
    exit 1
fi

# Check if Hyprland desktop file exists
if [ ! -f /usr/share/wayland-sessions/hyprland.desktop ] && [ ! -f ~/.local/share/wayland-sessions/hyprland.desktop ]; then
    echo "Warning: hyprland.desktop not found"
fi

# Start session with uwsm
if uwsm check may-start; then
    exec uwsm start hyprland.desktop
else
    echo "Error: uwsm cannot start session"
    # Fallback option (uncomment if desired)
    # exec Hyprland
    exit 1
fi
EOF

  # Make the file executable
  chmod +x "$XINITRC_FILE"

  echo "✓ Created and made executable: $XINITRC_FILE"
}

# Call the function
create_xinitrc

cp -r /usr/share/hypr ~/.config/
