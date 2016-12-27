#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


[ -f ~/.Xresources ] && xrdb -load ~/.Xresources
[ -f ~/.xprofile ] && xrdb -load ~/.xprofile

xset r rate 220 65
xset -dpms
xset s off

nm-applet &
exec i3
