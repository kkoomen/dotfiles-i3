#!/usr/bin/env bash

# Nautilus opens on default two windows. The nautilus window and a second desktop
# window (wtf?) so get rid of the desktop window with the following command:
gsettings set org.gnome.desktop.background show-desktop-icons false
