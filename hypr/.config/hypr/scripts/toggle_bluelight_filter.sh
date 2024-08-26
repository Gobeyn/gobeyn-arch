#!/bin/sh

# Define the two shaders to toggle between
DEFAULT_SHADER="$HOME/.config/hypr/shaders/default-shader.frag"
BLUELIGHT_SHADER="$HOME/.config/hypr/shaders/blue-shader.frag"

# Read the current shader.
CURRENT_SHADER=$(cat "$HOME/.shader.info")

# Determine which shader to switch to

if [ "$CURRENT_SHADER" == "$DEFAULT_SHADER" ]; then
    NEW_SHADER="$BLUELIGHT_SHADER"
else
    NEW_SHADER="$DEFAULT_SHADER"
fi

# Set the new shader
hyprctl keyword decoration:screen_shader "$NEW_SHADER"

# Update the shader info
echo "$NEW_SHADER" > "$HOME/.shader.info"

# Send a notification
FILENAME=$(basename "$NEW_SHADER")
notify-send "Shader switched" "$FILENAME"
