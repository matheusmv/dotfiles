#!/bin/sh

updates=$(checkupdates | wc -l)
icon=$HOME/.config/dunst/normal.png

notify-send -u normal -i $icon "UPDATES: $updates"
