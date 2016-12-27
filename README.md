# Getting started

- `$ git clone --recursive git@github.com:muts/dotfiles-i3.git`
- `$ cd dotfiles`
- `$ ./setup.sh`

# System Installation

packages needed: `sudo apt-get install termite curl wget vim vim-gtk network-manager py3status python-pip mpv`

python packages needed:

- python-mp2 (required by mpd_status from py3status)

### Install i3

```
$ sudo su -c "echo 'deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe' >> /etc/apt/sources.list"
$ sudo apt-get update
$ sudo apt-get --allow-unauthenticated install sur5r-keyring
$ sudo apt-get update
$ sudo apt-get install i3
```

# Fixes

### Nautilus

Nautilus opens on default two windows. The nautilus window and a second desktop window (wtf?) so get rid of
the desktop window with the following command:

`$ gsettings set org.gnome.desktop.background show-desktop-icons false`

### disable lightdm

1. `sudo vim /etc/default/grub`
2. change `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"` to `GRUB_CMDLINE_LINUX_DEFAULT="text"`.
3. run `sudo update-grub`.
4. `sudo systemctl enable multi-user.target --force`
5. `sudo systemctl set-default multi-user.target`
