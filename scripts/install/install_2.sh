#!/usr/bin/env bash
#
# This file is used to install environment related applications.
# We setup the keyboard backlight, set the correct mousepad settings,
# set the default notification service and do some bug fixes that ubuntu doesn't
# do by default.
#
# Besides that we copy our dotfiles to our home directory.

sudo cp ../../bin/* /usr/local/bin
sudo pip install --upgrade youtube_dl
sh ../arc_theme_install.sh
sh ../flux_install.sh
sh ../keyboard_backlight.sh
sh ../mousepad_setup.sh
sh ../vim_bundles_install.sh
sh ../xfce4_notifications_enable.sh
sh ../bug_fixes.sh
sh ../../update.sh
