#!/bin/sh

# Find all files and folders in the $HOME directory that end with .bak and delete them.
find "$HOME" -name "*.bak" -exec rm -rf {} +
echo "Deleted all *.bak files in $HOME."

