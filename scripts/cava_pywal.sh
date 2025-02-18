#!/bin/bash

color1=$( awk 'match($0, /color5=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh )
color2=$( awk 'match($0, /color3=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh )
color3=$( awk 'match($0, /color2=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh )
color4=$( awk 'match($0, /color4=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh )

sed -e "s/%%%%%%%/$color1/" -e "s/+++++++/$color2/" -e "s/-------/$color3/" -e "s/4444444/$color4/" ~/.config/cava/config.colors > /tmp/cava_colors

pid=$(pidof cava)

if [ -z $1 ]; then
  [ -z $pid ] && cava -p /tmp/cava_colors || kill -USR2 $pid
else
  [ -z $pid ] || kill -USR2 $pid
fi
