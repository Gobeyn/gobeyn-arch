#!/bin/sh

# Function to check if a certain package is installed
is_installed() {
  pacman -Qi "$1" &>/dev/null
}
# Function that installs yay if it is not already installed
install_yay() {
  # Check if yay is installed
  if is_installed "yay"; then
    echo "yay is already installed."
  else
    echo "Installing yay..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux/yay.git /tmp/yay
    cd /tmp/yay || exit
    makepkg -si --noconfirm
    cd ~ || exit
    rm -rf /tmp/yay
    echo "Finished installing yay."
  fi
}

# Install AUR packages with yay

PACKAGES=(
  "pandoc-crossref"
  "fuzzel"
  "wlogout"
  "sddm-sugar-dark"
  "qview"
)

install_aur_packages() {
  # Check if yay is installed
  if is_installed "yay"; then
    echo "Installing AUR packages..."
    for package in "${PACKAGES[@]}"; do
      yay -S --noconfirm --needed "$package"
    done
    echo "All yay packages have been installed."
  else
    echo "Could not install AUR packages, yay was not found."
  fi
}

install_yay
install_aur_packages
