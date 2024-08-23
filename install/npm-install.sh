#!/bin/sh

# Define a list of packages to be installed
PACKAGES=(
  "tree-sitter-cli"
)

# Define install function
install_packages() {
  for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    npm install -g "$package" --silent --no-progress
  done
  echo "All npm packages have been installed."
}

# Run the install function
install_packages
