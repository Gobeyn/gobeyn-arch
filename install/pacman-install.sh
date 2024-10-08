#!/bin/sh

# Packages to install with pacman

PACKAGES=(
  "base-devel"
  "bat"
  "bluez"
  "bluez-utils"
  "brightnessctl"
  "btop"
  "dolphin"
  "dunst"
  "eza"
  "fd"
  "firefox"
  "fzf"
  "git"
  "hyprlock"
  "hyprpaper"
  "imagemagick"
  "libreoffice-still"
  "man-db"
  "mpv"
  "neovim"
  "nodejs"
  "noto-fonts-cjk"
  "npm"
  "okular"
  "pacman-contrib"
  "pandoc-cli"
  "pipewire"
  "pipewire-alsa"
  "pipewire-jack"
  "pipewire-pulse"
  "playerctl"
  "python-pywal"
  "qt5-wayland"
  "qt6-wayland"
  "ripgrep"
  "rustup"
  "stow"
  "spotify-launcher"
  "texlive"
  "thefuck"
  "thunderbird"
  "tmux"
  "ttf-daddytime-mono-nerd"
  "udisks2"
  "unzip"
  "waybar"
  "wireplumber"
  "wl-clipboard"
  "yazi"
  "zathura"
  "zathura-pdf-mupdf"
  "zoxide"
  "zsh"
)

# Function for installing said packages
install_packages() {
  echo "Updating the system..."
  sudo pacman -Syu --noconfirm

  echo "Installing packages..."
  for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    sudo pacman -S --noconfirm --needed "$package"
  done

  echo "All pacman packages have been installed."
}

# Run the function
install_packages


