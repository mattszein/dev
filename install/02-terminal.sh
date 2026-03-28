#!/bin/bash

paru -S --noconfirm --needed \
  fd fzf ripgrep bat jq \
  wl-clipboard fastfetch btop \
  man less whois plocate \
  ffmpeg 7zip poppler zoxide \
  ghostty \
  alacritty \
  neovim \
  zsh \
  ydotool gitk eza nvtop btrfs-maintenance \
  docker docker-compose lazydocker-bin \
  cargo clang llvm mise \
  docker docker-compose lazydocker-bin lazygit \
  ttf-ia-writer ttf-jetbrains-mono-nerd \
  noto-fonts noto-fonts-cjk noto-fonts-emoji

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.config/ghostty/

sudo usermod -aG input $USER
export YDOTOOL_SOCKET=/tmp/.ydotool_socket
sudo systemctl enable ydotoold

eval "$(/usr/bin/mise activate zsh)"
echo 'eval "$(/usr/bin/mise activate zsh)"' >>~/.zshrc

# Limit log size to avoid running out of disk
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Start Docker automatically
sudo systemctl enable docker

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}

# Prevent Docker from preventing boot for network-online.target
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/no-block-boot.conf <<'EOF'
[Unit]
DefaultDependencies=no
EOF

sudo systemctl daemon-reload
