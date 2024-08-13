#!/bin/sh

# Check if the $HOME/.notes/ folder exists, if not make it.
DIRECTORY="$HOME/.notes"
if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$DIRECTORY"
fi

# Check if note file for current day already exists, if not make it.
FILE="$DIRECTORY/note-$(date +%Y-%m-%d).md"
if [ ! -d "$FILE" ]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $FILE
fi

# Open system editor in the notes file, and set the file up for
# writing a note

nvim "$FILE" -c "norm Go" -c "norm Go## $(date +%H:%M)" -c "norm G2o" -c "norm zz" -c "startinsert"
