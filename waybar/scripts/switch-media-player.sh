#!/usr/bin/env bash

STATE="$HOME/.cache/waybar-media-player"

# Find players currently exposing MPRIS
players=($(playerctl -l 2>/dev/null))

# No media players
if [ ${#players[@]} -eq 0 ]; then
    notify-send "Waybar" "No media player running."
    exit 0
fi

# Current player
if [[ -f "$STATE" ]]; then
    current=$(cat "$STATE")
else
    current="${players[0]}"
fi

# Find next player
next="${players[0]}"

for i in "${!players[@]}"; do
    if [[ "${players[$i]}" == "$current" ]]; then
        next="${players[$(((i + 1) % ${#players[@]}))]}"
        break
    fi
done

echo "$next" > "$STATE"

# Export so playerctl uses it
export PLAYERCTL_PLAYER="$next"

notify-send "Media Player" "Switched to: $next"