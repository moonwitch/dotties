#!/bin/bash

# Interfaces
eth=enp3s0
wifi=wlp3s0

# Echo the network label depending on network status
label="%{T2}"
# Ask to NetworkManager if we're online
nm-online -qt 10
if [ $? -eq 0 ]; then
    # Online
    if [ $(cat /sys/class/net/$wifi/carrier) == 1 ]; then
        # Wifi is connected
        label+=""
    elif [ $(cat /sys/class/net/$eth/carrier) == 1 ]; then
        # Cable connected
        label+=""
    fi
    # Checks for VPN
    if [ "$(pgrep openconnect)" ] || [ "$(pgrep wireguard)" ]; then
        # VPN is on
        label+="%{F#e2e2e2} 﫸"
    else
        # VPN is off
        label+="%{F#de935f} 﫸"
    fi
else
    # Offline
    label+=""
fi
echo $label

