#!/usr/bin/env bash

# Terminate already running waybar instances
pkill -9 waybar

# Wait until the waybar processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done
