yay -S --noconfirm --needed \
  brightnessctl playerctl pamixer pavucontrol wireplumber \
  fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool wl-clip-persist wf-recorder popsicle \
  ffmpegthumbnailer \
  mpv evince imv \
  transmission-cli transmission-gtk \
  nordvpn-bin \
  inkscape gimp \
  audacity spek-x-git \
  lm_sensors \
  gstreamer gst-plugins-bad gst-libav gst-plugins-base gst-plugins-good

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
for pkg in spotify discord; do
  yay -S --noconfirm --needed "$pkg" ||
    echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
done

yay -S --noconfirm --needed \
  walker elephant elephant-desktopapplications elephant-menus elephant-runner elephant-files elephant-calc elephant-symbols elephant-clipboard elephant-bluetooth elephant-snippets elephant-websearch

elephant service enable
systemctl --user start elephant.service

# Video downloader cli for youtube and others
# Usage examples:
#
# ./yt-dlp_linux -f "bestvideo[height<=720]+bestaudio/best[height<=720]" https://www.youtube.com/live/eDKZdonKtgk
#
#  ---Display the formats---
# ./yt-dlp_linux -F https://www.youtube.com/live/_CwrIuyXFLg
#
#  ---Download specific format---
# ./yt-dlp_linux -f 298+140 https://www.youtube.com/live/_CwrIuyXFLg

wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux -O ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp
