#!/bin/bash

# Get current HDMI output status
HDMI_STATUS=$(xrandr | grep "HDMI-A-0" | grep -o "connected (.*")

# Check if HDMI is in mirror mode (same position as eDP)
if xrandr | grep "HDMI-A-0" | grep -q "+0+0"; then
    echo "Switching to extended mode..."
    xrandr --output HDMI-A-0 --mode 1600x900 --right-of eDP
    echo "Extended mode activated"
else
    echo "Switching to mirror mode..."
    xrandr --output HDMI-A-0 --mode 1600x900 --same-as eDP
    echo "Mirror mode activated"
fi
