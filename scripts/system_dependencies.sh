#!/usr/bin/env bash

sudo apt-get install curl wget vim vim-gtk network-manager network-manager-openvpn-gnome \
  python-pip python-dev python3-dev python-setuptools mpv mpd mpc ncmpcpp \
  pavucontrol build-essential cmake xfce4-notifyd vlc lxappearance keepassx inxi \
  rofi feh arandr qbittorrent filezilla tree weechat scrot xclip p7zip-full dconf-editor

# install pip3
sudo easy_install3 pip

# py3status for i3 statusbar
sudo pip install py3status
# mpd support for the i3 statusbar
sudo easy_install python-mpd2

# disable mpd service and run it as normal user by putting it in ~/.xinitrc
sudo service mpd stop
sudo systemctl disable mpd

# install termite
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
sudo apt-get install -y \
  g++ \
  libgtk-3-dev \
  gtk-doc-tools \
  gnutls-bin \
  valac \
  intltool \
  libpcre2-dev \
  libglib3.0-cil-dev \
  libgnutls28-dev \
  libgirepository1.0-dev \
  libxml2-utils \
  gperf

echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x; sudo ln -s \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite
rm -rf termite/ vte-ng/
