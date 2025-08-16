#!/bin/sh

case "$1" in
    up)
        amixer set Master 5%+ unmute
        ;;
    down)
        amixer set Master 5%- unmute
        ;;
    toggle)
        amixer set Master toggle
        ;;
    *)
        echo "Usage: $0 {up|down|toggle}"
        exit 1
        ;;
esac

# notify dwmstatus to update immediately (no harm if not running)
pkill -USR1 -x dwmstatus 2>/dev/null || true

