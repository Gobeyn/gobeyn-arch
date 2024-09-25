#!/bin/sh

# Create .gobeyn-arch one HOME directory
mkdir -p "$HOME/.gobeyn-arch"

# Define info file filepaths 
WALLPAPERINFO="$HOME/.gobeyn-arch/wallpaper.info"
SHADERINFO="$HOME/.gobeyn-arch/shader.info"
BLURREDWALLPAPER="$HOME/.gobeyn-arch/blurred-wallpaper.png"

# Define content for the files
WALLPAPER_DEFAULT="$HOME/wallpapers/Anime-Girl2.png"
SHADER_DEFAULT="$HOME/.config/hypr/shaders/default-shader.frag"

# Write content to the appropriate files
echo "$WALLPAPER_DEFAULT" > "$WALLPAPERINFO"
echo "$SHADER_DEFAULT" > "$SHADERINFO"

# Blur the wallpaper
WALLPAPER=$(cat "$WALLPAPERINFO")
magick "$WALLPAPER" -blur 50x30 "$BLURREDWALLPAPER"

# Copy the LLM run script into .gobeyn-arch
cp "./install/llm_runner.sh" "$HOME/.gobeyn-arch/"

echo "Finished creating .info files."
