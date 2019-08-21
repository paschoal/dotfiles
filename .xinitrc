#!/bin/sh
xrdb -merge ~/.Xresource
systemctl --user import-environment DISPLAY
exec i3
