#!/bin/sh

# Get the current wallpaper path
WALLPAPERPATH=$(cat "$HOME/.gobeyn-arch/wallpaper.info")
BLURREDWALLPAPER="$HOME/.gobeyn-arch/blurred-wallpaper.png"

# Generate colorscheme based on the wallpaper with Pywal
wal -i $WALLPAPERPATH

# Use the output for kitty to generate a color config for Hyprland
INFILE="$HOME/.cache/wal/colors-kitty.conf"
OUTFILE="$HOME/.cache/wal/colors-hypr.conf"

# Initialise output file
> "$OUTFILE"

# Format it to the Hyprland config format
while IFS= read -r line; do
  if [ -z "$line" ]; then
    continue
  fi

  line=$(echo "$line" | tr 'A-Z' 'a-z')
  color_name=$(echo "$line" | awk '{print $1}')
  hex_value=$(echo "$line" | awk '{print $2}' | sed 's/#//')
  formatted_line="\$$color_name = rgb($hex_value)"
  echo "$formatted_line" >> "$OUTFILE"
done < "$INFILE"

# Set the wallpaper with Hyprpaper

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$WALLPAPERPATH"
hyprctl hyprpaper wallpaper ",$WALLPAPERPATH"

# Reload Waybar
killall waybar
waybar & disown

# Create blurred wallpaper
magick "$WALLPAPERPATH" -blur 50x30 "$BLURREDWALLPAPER"

# Notification
notify-send "Reloaded wallpaper"

