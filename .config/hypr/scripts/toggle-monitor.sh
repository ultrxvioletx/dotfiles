#!/bin/bash
# toggle-monitor.sh

MODE=${1:-"left"}
HDMI=$(grep '^\$hdmi' ~/.config/hypr/hyprland.conf | awk -F'= ' '{print $2}' | tr -d ' ')

case $MODE in
    laptop)
        hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x0, 1.33"
        hyprctl keyword monitor "$HDMI, disabled"
        notify-send "Monitor" "Solo laptop" -t 2000
        ;;
    mirror)
        hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x0, 1.33"
        hyprctl keyword monitor "$HDMI, 1920x1080@60, 0x0, 1, mirror, eDP-1"
        notify-send "Monitor" "Modo duplicado activado" -t 2000
        ;;
    left)
        hyprctl keyword monitor "$HDMI, 1920x1080@60, 0x0, 1"
        hyprctl keyword monitor "eDP-1, 1920x1200@60, 1920x0, 1.33"
        notify-send "Monitor" "Modo extendido activado (l)" -t 2000
        ;;
    right)
        hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x0, 1.33"
        hyprctl keyword monitor "$HDMI, 1920x1080@60, 1443x0, 1"
        notify-send "Monitor" "Modo extendido activado (r)" -t 2000
        ;;
esac