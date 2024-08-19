#!/bin/sh

# Set the directory and name of the screenshot
DIR="$HOME/Pictures/screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).jpg"

# Check if DIR exists, create if it does not
if [ ! -d "$DIR" ]; then
  mkdir -p "$DIR"
fi

# Take screenshot with grim and slurp
grim -g "$(slurp)" "$DIR$NAME"
# Check if a screenshot was actually taken
if [ -e "$DIR$NAME" ]; then 
  # Send notification
  notify-send "Screenshot taken"
  # Open the screenshot
  qview "$DIR$NAME"
else 
  # Send notification
  notify-send "Screenshot cancelled"
fi
