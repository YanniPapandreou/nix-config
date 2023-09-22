#!/usr/bin/env bash

# name of program you want to toggle
program_name="waybar"

# check if the program is currently running
if pgrep "$program_name" > /dev/null; then
  # If the program is running, stop it
  pkill "$program_name"
else
  # If the program is not running, start it
  while pgrep -x "$program_name" >/dev/null; do sleep 1; done
  "$program_name" &
fi
