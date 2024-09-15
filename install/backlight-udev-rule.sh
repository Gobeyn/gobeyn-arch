#!/bin/sh

# Line of rules to add according to Arch wiki
RULES='ACTION=="add", SUBSYSTEM="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness, RUN+="/bin/chmod g+w $sys$devpath/brightness"'
# Location of the file that should be written to.
RULES_FILE="/etc/udev/rules.d/backlight.rules"

# Check if the file exists, create it if not.
if [[ ! -f "$RULES_FILE" ]]; then
  touch "$RULES_FILE"
fi

# Add the rule if it is not present
if ! grep -Fxq "$RULES" "$RULES_FILE"; then
  echo "$RULES" >> "$RULES_FILE"
fi

# Reload rules
udevadm control --reload-rules && udevadm trigger
