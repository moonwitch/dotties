#!/bin/bash

IF=$1
STATUS=$2

if [ "$IF" == "vpn0" ]
then
    case "$2" in
        up)
        notify-send "NM Script up triggered"
        ;;
        down)
        notify-send "NM Script down triggered"
        ;;
        vpn-up)
        notify-send "NM Script vpn-up triggered"
        ;;
        vpn-down)
        notify-send s"NM Script vpn-down triggered"
        ;;
        *)
        ;;
    esac
fi
