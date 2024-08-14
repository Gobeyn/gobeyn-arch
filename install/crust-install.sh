#!/bin/sh

DEV_DIR="$HOME/dev"
CRUST_REPO="https://github.com/Gobeyn/crust.git"

# Create dev directory if it does not exist

if [ ! -d "$DEV_DIR" ]; then
  echo "Creating directory: $DEV_DIR"
  mkdir -p "$DEV_DIR"
fi

# Go into dev directory
cd "$DEV_DIR"

# Clone the repository
echo "Cloning repository from $CRUST_REPO"
git clone "$CRUST_REPO"
cd crust

# Build binary
echo "Building binary..."
make
echo "Installing binary..."
make install
echo "Cleaning..."
make clean
echo "Finished installing $CRUST_REPO"
