#!/bin/bash

WALLPAPER_DAY="$HOME/pixelpink.jpg"
WALLPAPER_NIGHT="$HOME/pixelpurple.jpg"

# aplicar fondo según hora
apply_wallpaper() {
    hour=$(date +%H)
    if [[ $hour -ge 6 && $hour -lt 19 ]]; then
        swww img "$WALLPAPER_DAY" --transition-type fade --transition-duration 1
        echo "[$(date)] Applied pixelpink"
    else
        swww img "$WALLPAPER_NIGHT" --transition-type fade --transition-duration 1
        echo "[$(date)] Applied pixelpurple"
    fi
}

apply_wallpaper