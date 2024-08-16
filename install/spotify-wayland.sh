#!/bin/sh

WAYLAND_LINE='extra_arguments = [\"--enable-features=UseOzonePlatform\", \"--ozone-platform=wayland\"]'
CONFIG_FILE="/etc/spotify-launcher.conf"
sudo sh -c "echo \"$WAYLAND_LINE\" >> $CONFIG_FILE"
