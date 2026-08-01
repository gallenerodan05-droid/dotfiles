#!/usr/bin/env bash

# ~/.config/waybar/scripts/switch-to-spotify.sh

# Is Spotify running?
if pgrep -x spotify >/dev/null; then
    # Focus the Spotify window if it exists
    hyprctl dispatch focuswindow "class:^(Spotify)$"

    # If it isn't focused, try toggling play/pause to wake MPRIS
    playerctl --player=spotify play-pause >/dev/null 2>&1
    playerctl --player=spotify play-pause >/dev/null 2>&1
else
    # Launch Spotify
    spotify >/dev/null 2>&1 &
fi