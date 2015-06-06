#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -q -o -f
exec i3
