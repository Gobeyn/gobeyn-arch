#!/bin/sh

# Copy sddm config into the right directory
sudo cp ./sddm/sddm.conf /etc/sddm.conf.d/
# Copy sugar dark theme into the right directory
sudo cp ./sddm/theme.conf /usr/share/sddm/themes/sugar-dark/
sudo cp ./sddm/espeon.jpg /usr/share/sddm/themes/sugar-dark/

echo "Finished setting up sddm greeter."
