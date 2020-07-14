#!/bin/sh

##################################################################
# Exporting Base Variables
##################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export WALLPAPER=$HOME/.wallpapers/dracula-arch.png
#Colors
xrdb ~/.Xresources

##################################################################
# Path Additions
##################################################################
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
# Ruby
export GEM_HOME=$HOME/.gem
export GEM_PATH=$(ruby -e 'puts Gem.user_dir')
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Ensuring SSH works
# if [ -f /usr/lib/xfce-polkit/xfce-polkit ]; then
#   killall xfce-polkit
#   /usr/lib/xfce-polkit/xfce-polkit &
# fi

if [ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]; then
  killall polkit-gnome-authentication-agent-1
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh &
export SSH_AUTH_SOCK

# Set keyboard to behave
setxkbmap us -variant altgr-intl

# Power management
xset dpms 300 600 900
#xidlehook \
#  --not-when-audio \
#  --not-when-fullscreen \
#  --timer 300 "betterlockscreen -l dim" "" \
#  --timer 1800 "systemctl suspend" "" &
xfce4-power-manager &

# Homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

##################################################################
# HiDPI
##################################################################
xrandr --dpi 163
xrandr --dpi 163

# Export variables
# HiDPI in QT4 and QT5
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96 vym
# Qt 5.14 uses this.
export QT_ENABLE_HIGHDPI_SCALING=1

# HiDPI in GTK -
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export XCURSOR_SIZE=32

# Wayland
# export MOZ_ENABLE_WAYLAND=1
# Wayland and QT
# export QT_QPA_PLATFORM=wayland-egl
# export QT_WAYLAND_FORCE_DPI=physical
# export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

##################################################################
# Default Applications
##################################################################
export PDFVIEWER=/usr/bin/zathura
export FILEMAN=/usr/bin/thunar
export TERMINAL=/usr/bin/alacritty
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium

