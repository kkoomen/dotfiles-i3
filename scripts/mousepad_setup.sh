#!/usr/bin/env bash

if [[ ! -d "/etc/X11/xorg.conf.d" ]]; then
  sudo mkdir -p /etc/X11/xorg.conf.d/
fi

sudo cp ../synaptics/50-synaptics.conf /etc/X11/xorg.conf.d/
