#!/bin/sh

# Create .gobeyn-arch one HOME directory
mkdir -p "$HOME/.gobeyn-arch"

# Define info file filepaths 
WALLPAPERINFO="$HOME/.gobeyn-arch/wallpaper.info"
SHADERINFO="$HOME/.gobeyn-arch/shader.info"
# BRIGHTNESSINFO="$HOME/.gobeyn-arch/brightness.info"
BLURREDWALLPAPER="$HOME/.gobeyn-arch/blurred-wallpaper.png"

# Define content for the files
WALLPAPER_DEFAULT="$HOME/wallpapers/Anime-Girl2.png"
SHADER_DEFAULT="$HOME/.config/hypr/shaders/default-shader.frag"
# BRIGHTNESS_DEFAULT="100"

# Write content to the appropriate files
echo "$WALLPAPER_DEFAULT" > "$WALLPAPERINFO"
echo "$SHADER_DEFAULT" > "$SHADERINFO"
# echo "$BRIGHTNESS_DEFAULT" > "$BRIGHTNESSINFO"

# Blur the wallpaper
WALLPAPER=$(cat "$WALLPAPERINFO")
magick "$WALLPAPER" -blur 50x30 "$BLURREDWALLPAPER"

echo "Finished creating .info files."
