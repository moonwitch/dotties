#!/bin/bash
# Colors
FOREGROUND=$(xrdb -query | grep 'foreground:' | awk '{print $NF}')
BACKGROUND=$(xrdb -query | grep 'background:' | awk '{print $NF}')
BLACK=$(xrdb      -query | grep 'color0:'     | awk '{print $NF}')
RED=$(xrdb        -query | grep 'color1:'     | awk '{print $NF}')
GREEN=$(xrdb      -query | grep 'color2:'     | awk '{print $NF}')
YELLOW=$(xrdb     -query | grep 'color3:'     | awk '{print $NF}')
BLUE=$(xrdb       -query | grep 'color4:'     | awk '{print $NF}')
MAGENTA=$(xrdb    -query | grep 'color5:'     | awk '{print $NF}')
CYAN=$(xrdb       -query | grep 'color6:'     | awk '{print $NF}')
WHITE=$(xrdb      -query | grep 'color7:'     | awk '{print $NF}')
BLACK1=$(xrdb     -query | grep 'color8:'     | awk '{print $NF}')
RED1=$(xrdb       -query | grep 'color9:'     | awk '{print $NF}')
GREEN1=$(xrdb     -query | grep 'color10:'    | awk '{print $NF}')
YELLOW1=$(xrdb    -query | grep 'color11:'    | awk '{print $NF}')
BLUE1=$(xrdb      -query | grep 'color12:'    | awk '{print $NF}')
MAGENTA1=$(xrdb   -query | grep 'color13:'    | awk '{print $NF}')
CYAN1=$(xrdb      -query | grep 'color14:'    | awk '{print $NF}')
WHITE1=$(xrdb     -query | grep 'color15:'    | awk '{print $NF}')


# Border colors
bspc config normal_border_color   $BACKGROUND
bspc config active_border_color   $WHITE
bspc config focused_border_color  $BLACK1
bspc config urgent_border_color   $RED1
bspc config presel_border_color   $WHITE1
bspc config presel_feedback_color $BLACK
