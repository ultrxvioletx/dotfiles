#!/bin/bash
# Modo duplicado (mirroring)
hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1.2"
hyprctl keyword monitor "HDMI-A-2, 1920x1080@60, 0x0, 1, mirror, eDP-1"
notify-send "Modo pantalla" "Duplicado activado" -t 2000
