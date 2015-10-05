#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -q -o -f
seq 0 1 | xargs -l1 -I@ compton -b -d :0.@ --config ~/.config/compton/config
exec i3
