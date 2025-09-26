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

swww init
apply_wallpaper

# duerme hasta el próximo cambio
while true; do
    hour=$(date +%H)
    minute=$(date +%M)
    current_minutes=$((hour * 60 + minute))

    # calcular minutos hasta 06:00 (360) y 19:00 (1140)
    next_day=360    # 06:00
    next_night=1140 # 19:00

    if [[ $current_minutes -ge 1140 || $current_minutes -lt 360 ]]; then
        # ahora es nochep, próximo cambio 06:00 mañana
        target_minutes=360 + 1440  # sumar 24h en minutos si ya pasó
    else
        # ahora es día, próximo cambio 19:00 hoy
        target_minutes=1140
    fi

    # si ya pasó 19:00, el próximo 06:00 es mañana
    if [[ $current_minutes -ge 1140 ]]; then
        target_minutes=360 + 1440
    elif [[ $current_minutes -ge 360 ]]; then
        target_minutes=1140
    fi

    sleep_seconds=$(( (target_minutes - current_minutes) * 60 - $(date +%S) ))

    # protección contra sleep negativo (al reanudar de hibernación)
    if [[ $sleep_seconds -le 0 ]]; then
        sleep_seconds=60  # revisar en 1 minuto
    fi

    # dormir hasta el próximo cambio
    sleep "$sleep_seconds"

    # tras despertar aplicar fondo (por si se saltó el cambio por hibernación)
    apply_wallpaper
done