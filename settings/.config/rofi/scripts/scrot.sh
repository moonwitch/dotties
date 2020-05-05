#!/bin/bash

rofi_command="rofi -theme themes/scrot.rasi"

### Options ###
area=""
screen=""
window=""
# Variable passed to rofi
options="$area\n$screen\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $area)
        i3-scrot -s
        ;;
    $screen)
        sleep 1; i3-scrot -d
        ;;
    $window)
        sleep 1; i3-scrot -w
        ;;
esac

