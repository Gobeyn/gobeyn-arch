#!/bin/sh

# Script that runs the install shell scripts, and echo's if something 
# goes wrong.

run_script() {
  if ./"$1"; then
    echo "Succesfully executed $1."
  else
    echo "Error executing $1. Exiting."
    exit 1
  fi
}

# Define the scripts to run, in order
SCRIPTS=(
  "./install/pacman-install.sh"
  "./install/yay-install.sh"
  "./install/crust-install.sh"
  "./install/zsh-default.sh"
  "./install/setup-sddm.sh"
  "./install/spotify-wayland.sh"
  "./install/backup.sh"
  "./install/wallpaper.sh"
  "./install/create-info-files.sh"
  "./install/stow-dotfiles.sh"
)

# Run the scripts
for script in "${SCRIPTS[@]}"; do
  run_script "$script"
done

echo "Finished running the install scripts."
