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

bash ../arc_theme_install.sh
bash ../flux_install.sh
bash ../keyboard_backlight.sh
bash ../mousepad_setup.sh
bash ../vim_bundles_install.sh
bash ../xfce4_notifications_enable.sh
bash ../font_awesome_install.sh
bash ../font_awesome_install.sh
bash ../google_chrome_install.sh
bash ../touchpad.sh
bash ../bug_fixes.sh
bash ../../update.sh
