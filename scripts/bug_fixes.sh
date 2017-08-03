#!/usr/bin/env bash

# Nautilus opens on default two windows. The nautilus window and a second desktop
# window (wtf?) so get rid of the desktop window with the following command:
gsettings set org.gnome.desktop.background show-desktop-icons false

# set list view default for nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# A common case would be that QT doesn't extend GTK+ applications theme set in
# ~/.gtkrc-2.0. The following command will tell QT to inherit the style of GTK+.
sed -i.bak 's/^style=$/style=GTK/g' ~/.config/Trolltech.conf
