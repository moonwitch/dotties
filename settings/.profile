#!/bin/sh

##################################################################
# Exporting Base Variables
##################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export WALLPAPER=$HOME/.wallpapers/Gruv-Mountain.jpg
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

##################################################################
# Default Applications
##################################################################
export PDFVIEWER=/usr/bin/evince
export FILEMAN=/usr/bin/nemo
export TERMINAL=/usr/bin/alacritty
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/code
eval $(/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
