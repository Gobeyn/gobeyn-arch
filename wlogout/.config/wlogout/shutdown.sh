#!/bin/sh

# Reset the shader to the default shader
echo "$HOME/.config/hypr/shaders/default-shader.frag" > "$HOME/.gobeyn-arch/shader.info"

# Set brightness back to max
# NOTE: For some reason, this doesn't work
BACKLIGHT_DIR="/sys/class/backlight"

if [ -d "$BACKLIGHT_DIR" ]; then
  for DEVICE in "$BACKLIGHT_DIR/*/"; do
    DEVICE_NAME=$(basename "$DEVICE")
    brightnessctl --device="$DEVICE_NAME" s 100%
  done
fi

# Shutdown
systemctl poweroff
