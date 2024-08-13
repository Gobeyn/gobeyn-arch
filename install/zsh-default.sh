#!/bin/sh

ZSH_PATH="/usr/bin/zsh"

# Set zsh as the default shell, if the binary for it exists.
if command -v "$ZSH_PATH" &>/dev/null; then 
  chsh -s "$ZSH_PATH"
fi
