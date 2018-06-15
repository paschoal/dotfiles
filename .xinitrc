#!/bin/sh
systemctl --user import-environment DISPLAY
exec i3
