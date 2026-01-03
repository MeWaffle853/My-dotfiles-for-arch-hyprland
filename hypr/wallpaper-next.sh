#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
STATE_FILE="$HOME/.cache/current_wallpaper"

# start swww if needed
pgrep -x swww-daemon >/dev/null || swww-daemon &

sleep 0.2

mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f | sort)

# safety check
[ "${#WALLPAPERS[@]}" -eq 0 ] && exit 1

# get current index
if [[ -f "$STATE_FILE" ]]; then
    CURRENT=$(<"$STATE_FILE")
else
    CURRENT=0
fi

NEXT=$(( (CURRENT + 1) % ${#WALLPAPERS[@]} ))

echo "$NEXT" > "$STATE_FILE"

swww img "${WALLPAPERS[$NEXT]}" \
  --transition-type grow \
  --transition-pos 0.5,0.5 \
  --transition-duration 1
