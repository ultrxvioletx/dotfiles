#!/bin/bash
# ~/.config/hypr/scripts/ags-watchdog.sh
while true; do
    sleep 10800 #3 horas
    pkill -f "gjs.*ags" && sleep 2 && ags &
done