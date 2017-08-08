#!/usr/bin/env bash

sudo apt-get install xserver-xorg-core xserver-xorg-input-libinput

if [[ ! -d /etc/X11/xorg.conf.d/ ]]; then
  echo "/etc/X11/xorg.conf.d/ is not a directory."
  exit 1
fi

sudo cp ../conf/90-libinput.conf /etc/X11/xorg.conf.d/
