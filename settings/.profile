#!/bin/sh

# sourced at boot by ~/.xinitrc and most display managers

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Autostart some shit
numlockx &
xfce4-power-manager &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
gnome-keyring-daemon --start --components=pkcs11,ssh &

# Have some keyboard fun
setxkbmap us -variant altgr-intl

# Power management
xset dpms 300 600 900
# Trigger screensaver after 10 minutes of inactivity
# xset s on
# xset s 600
# xautolock -detectsleep -time 5 -locker "betterlockscreen -l dim" -killtime 30 -killer "systemctl suspend" &

# Only exported variables can be used within the timer's command.
# export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"
#
# # Run xidlehook
# xidlehook \
#   `# Don't lock when there's a fullscreen application` \
#   --not-when-fullscreen \
#   `# Don't lock when there's audio playing` \
#   --not-when-audio \
#   `# Dim the screen after 60 seconds, undim if user becomes active` \
#   --timer 60 \
#     'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
#     'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
#   `# Undim & lock after 10 more seconds` \
#   --timer 10 \
#     'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; i3lock' \
#     '' \
#   `# Finally, suspend an hour after it locks` \
#   --timer 3600 \
#     'systemctl suspend' \
#     ''

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
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# Qt 5.14 uses this.
export QT_ENABLE_HIGHDPI_SCALING=1

#export QT_SCALE_FACTOR=1.75
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
