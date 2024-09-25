#!/bin/sh

# Check if a prompt is provided
if [ -z "$1" ]; then
  echo "A prompt need to be provided."
  exit 1
fi

# Create directory for LLM responses if it does not exist.
mkdir -p $HOME/.llm-responses

# Store prompt in a variable
PROMPT="$1"

# Create the filename base on the current date and time
FILENAME="$(date +"%Y-%m-%d-%H-%M-%S").md"
FILEDIR="$HOME/.llm-responses/$FILENAME"

# Check if the --continue flag is passed, if so, add the context 
# of the latest generated file.
if [[ "$2" == "--continue" ]]; then
  # Check if the LLM response directory is non-empty
  if [ -d "$HOME/.llm-responses/" ]; then
    # Get the latest created file
    LATEST_FILE=$(ls -t "$HOME/.llm-responses"/*.md 2> /dev/null | head -n 1)
    # Update the prompt with context
    PROMPT="$(cat $LATEST_FILE)\n# Prompt\n$PROMPT"
    # Run ollama with Mistal on the prompt
    RESPONSE=$(ollama run mistral "$PROMPT")
    # Echo the prompt and response into a Markdown file, note that 
    # we do not need another prompt header
    echo -e "$PROMPT\n# Response\n$RESPONSE" > "$FILEDIR"
    # Remove the old file
    rm "$LATEST_FILE"
  else
    echo "--continue flag cannot be passed if there are no previous responses."
  fi
else
  # If --continue is not passed, this is a new conversation.

  # Run Ollama with Mistral on the prompt
  RESPONSE=$(ollama run mistral "$PROMPT")

  # Echo the prompt and response into a Markdown file
  echo -e "# Prompt\n$PROMPT\n# Response\n$RESPONSE" > "$FILEDIR"
fi

# Display the contents of the Markdown file we just generated.
bat "$FILEDIR"

# Send notification
notify-send "LLM Mistral finished writing response."

