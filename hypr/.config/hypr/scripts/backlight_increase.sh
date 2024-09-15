#!/bin/sh

# Define the backlight directory
BACKLIGHT_DIR="/sys/class/backlight"

# Loop through all the devices
if [ -d "$BACKLIGHT_DIR" ]; then
  for DEVICE in "$BACKLIGHT_DIR"/*/; do
    # Get the device name
    DEVICE_NAME=$(basename "$DEVICE")
    # Increase the brightness by 5% with brightnessctl
    brightnessctl --device="$DEVICE_NAME" s 10%+
  done
fi
