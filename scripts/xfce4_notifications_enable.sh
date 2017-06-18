#!/usr/bin/env bash

# i3 uses dunst on default so we want to remove that
sudo apt-get purge dunst
pkill dunst
pkill notify-osd

# install xfce-notifyd
sudo apt-get install xfce4-notifyd

# disable the default notification service
sudo mv /usr/share/dbus-1/services/org.freedesktop.Notifications.service /usr/share/dbus-1/services/org.freedesktop.Notifications.service.disabled
