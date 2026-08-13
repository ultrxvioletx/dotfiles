#!/usr/bin/env bash
# Enciende/apaga luz nocturna en todos los monitores

if pgrep -x wlsunset >/dev/null; then
    pkill -x wlsunset
else
    setsid -f wlsunset -T 3820 -t 3800 -g 1 >/dev/null 2>&1
fi