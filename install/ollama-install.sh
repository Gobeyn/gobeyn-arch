#!/bin/sh

# Install ollama
curl -fsSL https://ollama.com/install.sh | sh

# Download Mistral, if ollama is installed
if command -v ollama &> /dev/null 
then
  ollama run mistral
fi


