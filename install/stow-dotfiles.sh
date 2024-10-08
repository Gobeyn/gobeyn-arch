#!/bin/sh

# List of directories to stow
directories=(
  "dunst"
  "dumpling"
  "fuzzel"
  "hypr"
  "kitty"
  "mpv"
  "nvim"
  "tmux"
  "waybar"
  "wlogout"
  "zathura"
  "zsh"
)

# Function to stow directories
stow_directories() {
  for dir in "${directories[@]}"; do
    echo "Stowing $dir..."
    stow $dir
  done
}

# Run the stow function
stow_directories
