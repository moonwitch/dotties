#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# numlock
if [ -x /usr/bin/numlockx ]; then
      /usr/bin/numlockx on
fi

# monitor
xrandr --dpi 162

# Lockscreen loading on inactivity
# xautolock -detectsleep -time 15 -locker "dm-tool lock" -killtime 30 -killer "systemctl suspend" &

# Start Compositor
picom -b

# Start Tray Applets (network + pamac)
# nm-applet &
# pamac-tray &

# setxkbmap -layout us -variant euro
setxkbmap -layout us -variant altgr-intl

# Start Synology
if hash synology-drive > /dev/null 2>&1 ; then
    /usr/bin/synology-drive &
fi

# Start RedShift
# killall redshift
# redshift &

exec bspwm
