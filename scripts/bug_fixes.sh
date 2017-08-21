#!/usr/bin/env bash

# Nautilus opens on default two windows. The nautilus window and a second desktop
# window (wtf?) so get rid of the desktop window with the following command:
gsettings set org.gnome.desktop.background show-desktop-icons false

# nautilus custom configuration
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gnome.nautilus.desktop network-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-visible true
gsettings set org.gnome.nautilus.desktop volumes-visible true
gsettings set org.gnome.nautilus.window-state sidebar-width 400

# A common case would be that QT doesn't extend GTK+ applications theme set in
# ~/.gtkrc-2.0. The following command will tell QT to inherit the style of GTK+.
sed -i.bak 's/^style=$/style=GTK/g' ~/.config/Trolltech.conf
