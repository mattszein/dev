yay -S --noconfirm --needed \
  brightnessctl playerctl pamixer pavucontrol wireplumber \
  fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool wl-clip-persist \
  ffmpegthumbnailer \
  mpv evince imv

# Add screen recorder based on GPU
if lspci | grep -qi 'nvidia'; then
  yay -S --noconfirm --needed wf-recorder
else
  yay -S --noconfirm --needed wl-screenrec
fi

rustup default stable
yay -S --noconfirm --needed ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
yay -S --noconfirm --needed yazi nautilus

# Packages known to be flaky or having key signing issues are run one-by-one
for pkg in spotify; do
  yay -S --noconfirm --needed "$pkg" ||
    echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
done
