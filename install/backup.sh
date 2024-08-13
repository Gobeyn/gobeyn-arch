#!/bin/sh

# List of files and directories that need to be backed up
BACKUP=(
  "$HOME/.zshrc"
  "$HOME/.p10k.zsh"
  "$HOME/.config/"
)

for item in "${BACKUP[@]}"; do
  # Check if the file/directory actually exists
  if [ -e "$item" ]; then 
    # Rename the file/directory by appending ".bak"
    mv "$item" "'$item'.bak"
  else
    echo "Warning: '$item' does not exist."
  fi
done
