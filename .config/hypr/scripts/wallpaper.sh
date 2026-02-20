#!/bin/bash

PINK="$HOME/pixelpink.jpg"
PURPLE="$HOME/pixelpurple.jpg"

# aplicar fondo según hora
hour=$(date +%H)
if [[ $hour -ge 6 && $hour -lt 19 ]]; then
    swww img "$PINK" --transition-type fade --transition-duration 1
    echo "[$(date)] Applied pixelpink"
else
    swww img "$PURPLE" --transition-type fade --transition-duration 1
    echo "[$(date)] Applied pixelpurple"
fi