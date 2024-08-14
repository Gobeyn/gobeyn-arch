#!/bin/sh

# Define info file filepaths 
WALLPAPERINFO="$HOME/.wallpaper.info"
SHADERINFO="$HOME/.shader.info"

# Define content for the files
WALLPAPER_DEFAULT="$HOME/wallpapers/Anime-Girl2.png"
SHADER_DEFAULT="$HOME/.config/hypr/shaders/default-shader.frag"

# Write content to the appropriate files
echo "$WALLPAPER_DEFAULT" > "$WALLPAPERINFO"
echo "$SHADER_DEFAULT" > "$SHADERINFO"
echo "Finished creating .info files."
