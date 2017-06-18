#!/usr/bin/env bash

sudo apt-get install xfce4-notifyd
sudo mv /usr/share/dbus-1/services/org.freedesktop.Notifications.service /usr/share/dbus-1/services/org.freedesktop.Notifications.service.disabled
