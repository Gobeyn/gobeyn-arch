#!/bin/sh

# Get random wallpaper from the $HOME/wallpapers directory
WALLPAPERS_DIR="$HOME/wallpapers"
RANDOM_WALLPAPER=$(ls "$WALLPAPERS_DIR" | shuf -n 1)
WALLPAPERPATH="$WALLPAPERS_DIR/$RANDOM_WALLPAPER"

# Save the new wallpaper information
echo "$WALLPAPERPATH" > "$HOME/.wallpaper.info"

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

# Notification
notify-send "Wallpaper changed" "$WALLPAPERPATH"
