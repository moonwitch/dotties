#!/bin/sh

WALLPAPER=$HOME/.config/wallpapers/003.png

convert $WALLPAPER -blur 20 /tmp/blur.png

i3lock -n --image $WALLPAPER --fuzzy -e --radius=150
