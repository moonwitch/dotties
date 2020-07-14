#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"

### Options ###
lock=" Lock"
suspend="鈴 Suspend"
power_off=" Shut down"
reboot=" Reboot"
log_out=" Exit"
# Variable passed to rofi
options="$lock\n$suspend\n$power_off\n$reboot\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
  $lock)
    i3lock
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
