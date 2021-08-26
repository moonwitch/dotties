#!/bin/sh

##################################################################
# Exporting Base Variables
##################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export WALLPAPER=$HOME/.wallpapers/Gruv-Mountain.jpg
#export WALLPAPER=$HOME/.wallpapers/foxy_nigh_wp_leksi_reppo_big.png
export FONT="Overpass Mono"

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
# Java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export PATH=$PATH:$JAVA_HOME/bin

# Ensuring SSH works
if [ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]; then
  killall polkit-gnome-authentication-agent-1
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh &
export SSH_AUTH_SOCK

# Set keyboard to behave
setxkbmap -layout us -variant altgr-intl

# Power management
xset dpms 300 600 900
xfce4-power-manager &

##################################################################
# HiDPI
##################################################################
xrandr --dpi 163
xrandr --dpi 163
# HiDPI in QT4 and QT5
export QT_AUTO_SCREEN_SCALE_FACTOR=0 #Has to be disabled, since my screen isn't 192 DPI
export QT_SCREEN_SCALE_FACTORS=1.5
# export QT_SCALE_FACTOR=2
# export QT_FONT_DPI=96 vym
export QT_FONT_DPI=163
# Qt 5.14 uses this.
export QT_ENABLE_HIGHDPI_SCALING=0
# HiDPI in GTK
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export XCURSOR_SIZE=32

##################################################################
# Default Applications
##################################################################
export PDFVIEWER=/usr/bin/evince
export FILEMAN=/usr/bin/nemo
export TERMINAL=/usr/bin/alacritty
export BROWSER=/usr/bin/google-chrome-stable
export EDITOR=/usr/bin/code

