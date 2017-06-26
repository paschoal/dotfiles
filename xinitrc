#!/bin/sh
autocutsel -selection CLIPBOARD -fork
autocutsel -selection PRIMARY -fork

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -q -o -f

exec i3
