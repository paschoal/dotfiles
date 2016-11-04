#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -q -o -f
campton --backend glx --unredir-if-possible --vsync --opengl-swc
#dunst > /dev/null 2>&1 &
exec i3
