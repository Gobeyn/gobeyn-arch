#!/bin/sh

# Go to the directory of wallpapers and select random one
# WALLPAPERS_DIR="$HOME/wallpapers/pokemon-wallpapers/"
WALLPAPERS_DIR="$HOME/.config/wallpapers/"
random_wallpaper=$(ls "$WALLPAPERS_DIR" | shuf -n 1)
wallpaper="$WALLPAPERS_DIR/$random_wallpaper"

# Set the wallpaper with hyprpaper
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$wallpaper"
hyprctl hyprpaper wallpaper ",$wallpaper"

# Generate a colorscheme based on the wallpaper, saved in 
# $HOME/.cache/wal
wal -i $wallpaper

# Use one of the generate files in the $HOME/.cache/wal directory
# to generate a file that can be used with hyprland

input_file="$HOME/.cache/wal/colors-kitty.conf"
output_file="$HOME/.cache/wal/colors-hypr.conf"

# Initialise the output file, create it if it does not exists and 
# clear it if it does.
> "$output_file"

# Loop through each line in the input file
while IFS= read -r line; do
	# Check if the line is empty
	if [ -z "$line" ]; then
		continue
	fi

	# Convert line to lower case
	line=$(echo "$line" | tr 'A-Z' 'a-z')

	# Extract color name and hex value
	color_name=$(echo "$line" | awk '{print $1}')
	hex_value=$(echo "$line" | awk '{print $2}' | sed 's/#//')

	# Format the information
	formatted_line="\$$color_name = rgb($hex_value)"

	# Write the formatted line to the output file
	echo "$formatted_line" >> "$output_file"
done < "$input_file"

