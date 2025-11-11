#!/bin/bash

while true; do
    mem_total=$(free -m | awk '/Mem:/ {print $2}')
    mem_avail=$(free -m | awk '/Mem:/ {print $7}')
    mem_used=$((mem_total - mem_avail))
    mem_pct=$((100 * mem_used / mem_total))
    loadavg=$(awk '{print $1", "$2", "$3}' /proc/loadavg)
    datetime=$(date +"%a %d %b %Y  %H:%M:%S")

    default_sink=$(pactl info | awk -F': ' '/Default Sink/ {print $2}')
    if [ -n "$default_sink" ]; then
        vol=$(pactl get-sink-volume "$default_sink" | awk '{print $5}' | head -n1)
        sink_name=$(pactl list sinks short | awk -v s="$default_sink" '$1==s {print $2}')
        audio_info="$sink_name $vol"
    else
        audio_info="No audio"
    fi

    # echo "RAM: ${mem_used}M/${mem_total}M (${mem_pct}%) | Load: $loadavg | $datetime"
    echo "RAM: ${mem_used}M/${mem_total}M (${mem_pct}%) | Load: $loadavg | $audio_info | $datetime"
    sleep 0.5
done
