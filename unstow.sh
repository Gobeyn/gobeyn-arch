
#!/bin/sh

# List of directories to stow
directories=(
  "dunst"
  "fuzzel"
  "hypr"
  "kitty"
  "mpv"
  "nvim"
  "waybar"
  "wlogout"
  "zathura"
  "zsh"
)

# Function to stow directories
unstow_directories() {
  for dir in "${directories[@]}"; do
    echo "Unstowing $dir..."
    stow -D $dir
  done
}

# Run the stow function
unstow_directories
