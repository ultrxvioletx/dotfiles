#!/bin/bash

# SCRIPT DE INICIO DE SESIÓN PARA HYPRLAND
# Lanza las aplicaciones iniciales y las posiciona en sus workspaces
# sin crear reglas de ventana permanentes.


# --- LANZAR APLICACIONES EN SEGUNDO PLANO ---
sleep 1
firefox
hyprctl dispatch focuswindow "^(firefox)$"
hyprctl dispatch movetoworkspace 1

sleep 3
code
hyprctl dispatch focuswindow "^(Code)$"
hyprctl dispatch movetoworkspace 2

sleep 3
kitty
hyprctl dispatch focuswindow "^(kitty)$"
hyprctl dispatch movetoworkspace 3

# --- ESTABLECER EL FOCO FINAL ---
hyprctl dispatch workspace 3

exit 0