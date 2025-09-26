#!/bin/bash
# Modo extendido (monitor adicional a la izquierda)
hyprctl keyword monitor "HDMI-A-2, 1920x1080@60, -1920x0, 1"
hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1.2"
notify-send "Modo pantalla" "Extendido activado" -t 2000
