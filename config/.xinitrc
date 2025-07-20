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
