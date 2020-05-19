#!/bin/sh

# sourced at boot by ~/.xinitrc and most display managers

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Autostart some shit
numlockx &
if [ -f /usr/lib/xfce-polkit/xfce-polkit ]; then
  killall xfce-polkit
  /usr/lib/xfce-polkit/xfce-polkit &
fi
gnome-keyring-daemon --start --components=pkcs11,ssh &
/usr/bin/synology-drive &
udiskie --tray &

# Have some keyboard fun
setxkbmap us -variant altgr-intl

# Power management
xset dpms 300 600 900

# Ruby exports
export GEM_HOME=$HOME/.gem
export GEM_PATH=$(ruby -e 'puts Gem.user_dir')
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Homebrew
[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# HiDPI
xrandr --dpi 163

# Export variables
# HiDPI in QT4 and QT5
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_DEVICE_PIXEL_RATIO=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=1
# HiDPI in GTK
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export XCURSOR_SIZE=32

# Wayland
export MOZ_ENABLE_WAYLAND=1
# Wayland and QT
# QT_QPA_PLATFOR=wayland-egl
# QT_WAYLAND_FORCE_DPI=physical
# QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export WALLPAPER=$HOME/.wallpapers/HazedGroot.jpg
export DEFAULT_MONO_FONT="Hasklug Nerd Font Mono:style=Regular"
export DEFAULT_FONT="Hasklug Nerd Font:style=Regular"

# Default Applications
export EDITOR=/usr/bin/kak
export PDFVIEWER=/usr/bin/zathura
export FILEMAN=/usr/bin/thunar
export TERMINAL=/usr/bin/urxvt
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium
