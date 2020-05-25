#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"

### Options ###
lock=""
suspend="鈴"
power_off=""
reboot=""
log_out=""
# Variable passed to rofi
options="$lock\n$suspend\n$power_off\n$reboot\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
  $lock)
    dm-tool lock
    ;;
  $suspend)
    systemctl suspend
    ;;
  $power_off)
    systemctl poweroff
    ;;
  $reboot)
    systemctl reboot
    ;;
  $log_out)
    i3-msg exit
    ;;
esac
