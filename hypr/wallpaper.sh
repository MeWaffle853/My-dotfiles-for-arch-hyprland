#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
INTERVAL=300   # seconds (300 = 5 minutes)

# start swww if not running
pgrep -x swww-daemon >/dev/null || swww-daemon &

sleep 1

while true; do
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    swww img "$WALLPAPER" \
        --transition-type grow \
        --transition-pos 0.5,0.5 \
        --transition-duration 1

    sleep $INTERVAL
done
