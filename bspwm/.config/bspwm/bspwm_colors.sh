#!/usr/bin/env bash

bspc config focused_border_color "$(xrdb -query | grep 'color4:'| awk '{print $NF}')"
bspc config normal_border_color "$(xrdb -query | grep 'color0:'| awk '{print $NF}')"
bspc config active_border_color "$(xrdb -query | grep 'color5:'| awk '{print $NF}')"
bspc config presel_feedback_color "$(xrdb -query | grep 'color2:'| awk '{print $NF}')"

