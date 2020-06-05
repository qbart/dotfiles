#!/bin/bash
ID=$(xdpyinfo | rg focus | cut -f4 -d " ")
PID=$(($(xprop -id $ID | rg -m 1 PID | cut -d " " -f 3) + 2))
if [ -e "/proc/$PID/cwd" ]
then
    alacritty --working-directory $(readlink /proc/$PID/cwd) &
else
    alacritty
fi
