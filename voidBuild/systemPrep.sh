baseDir="$(dirname $(realpath $0))"
homeDir="$baseDir/home/user"

printf "### Updating system..."
doas xbps-install -Syu
printf "### Installing X..."
doas xpbs-install -Sy xorg-server xinit libX11-devel libXft-devel libXinerama-devel glib-devel liberation-fonts-ttf 
printf "### Installing Building toolsxhkd sssss..."
doas xbps-install -Sy git gcc make pkg-config sxhkd
printf "### Installing man pages...."
doas xbps-install -Sy man-pages-devel
printf "### Installing dev tools"
doas xbps-install -Sy git go neovim
printf "### Installing tools for suckless serv"
doas xbps-install -Sy webkit2gtk-devel gcr-devel

printf "### Installing tools for suckless serv playing video"
doas xbps-install -Sy gst-libav gst-plugins-good1

printf "### Installing Multimedia"
doas xbps-install -Sy ffmpeg mpv yt-dlp

printf "### Installing Diagnostics"
doas xbps-install -Sy htop fastfetch

printf "### Installing General tools"
doas xbps-install -Sy groff zathura-pdf-mupdf rsync firefox alsa-utils xz ImageMagic pass amiri-font

printf "### Installing e-Mail Tools"
doas xbps-install -Sy neomutt

printf "### Installing file system support"
doas xbps-install -Sy fuse-exfat lf nnn

printf "### Installing Intel"
doas xbps-install -Sy mesa mesa-dri mesa-vulkan-intel libva-intel-driver intel-video-accel intel-media-driver libva-utils

