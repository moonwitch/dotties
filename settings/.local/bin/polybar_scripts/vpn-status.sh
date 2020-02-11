#!/bin/sh

IFACE=$(ifconfig | grep vpn0 | awk '{print $1}' | cut -d ':' -f1)

if [ "$IFACE" = vpn0 ]; then
    echo "$(ifconfig vpn0 | grep inet | awk '{print $2}' | cut -f2 -d ':')"
else
    echo "NOVPN"
fi